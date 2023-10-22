from contextlib import suppress
from pulsectl import Pulse

import asyncio
import pulsectl_asyncio
import signal
import subprocess
import time

BATTERY_FILE_PATH="/sys/class/power_supply/BAT1"

class Status:
    def __init__(self, pulse):
        self.pulse = pulse
        self.battery_charging_indicator = ""
        self.battery_percentage = 0
        self.volume = 0
        self.time = ""

    def print_status(self):
        status = f"Volume: {self.volume} | Battery: {self.battery_percentage}%{self.battery_charging_indicator} | {self.time}"
        subprocess.run(["dwlb", "-status", "all", status])
        #print(status)

    async def set_initial_values(self):
        await self.set_battery_and_time()
        await self.set_volume()

    # setters
    async def set_battery_and_time(self):
        t = time.localtime()
        self.time = time.strftime("%A %b %d %H:%M%p", t)

        battery_status = ""
        try:
            with open(f"{BATTERY_FILE_PATH}/capacity", 'r') as capacity, open(f"{BATTERY_FILE_PATH}/status", 'r') as status:
                self.battery_percentage = int(capacity.read())
                battery_status = status.read()
        except FileNotFoundError:
            print("Battery status files not found.")
            exit(2)
        finally:
            capacity.close()
            status.close()

        if battery_status.strip() == "Charging":
            self.battery_charging_indicator = " (⚡)"
        else:
            self.battery_charging_indicator = ""

    async def set_volume(self):
        server_info = await self.pulse.server_info()
        default_sink = await self.pulse.get_sink_by_name(server_info.default_sink_name)
        if default_sink.mute:
            self.volume = "Muted"
        else:
            self.volume = f"{int(default_sink.volume.value_flat * 100)}%"

    # event handlers
    async def pulse_listen(self):
        # todo: cleanup, only listen for certain events
        async for event in self.pulse.subscribe_events('all'):
            if event.t == "new":
                await self.set_volume()
                self.print_status()
    
    async def clock_tick(self):
        while True:
            await asyncio.sleep(5)
            await self.set_battery_and_time()
            self.print_status()

async def main():
    async with pulsectl_asyncio.PulseAsync('peak-listener') as pulse:
        status = Status(pulse)

        await status.set_initial_values()
        status.print_status()

        pulse_listen_task = asyncio.create_task(status.pulse_listen())
        clock_tick_task = asyncio.create_task(status.clock_tick())

        with suppress(asyncio.CancelledError):
            await asyncio.gather(pulse_listen_task, clock_tick_task)

if __name__ == '__main__':
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    loop.run_until_complete(main())
