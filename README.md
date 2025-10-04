# Time.luau
Simple time conversions

```luau
--!strict

local TimeConverter = require("@self/Time")

local Timer = TimeConverter.New()
Timer:AddHours(2)
print(Timer.Minutes) -- 120
print(Timer.Seconds) -- 7200

local AnotherTimer = TimeConverter.New()
AnotherTimer:AddDays(1):AddHours(6)
print(AnotherTimer.Hours) -- 30

print(TimeConverter.FromMinutes(60)) -- 3600
print(TimeConverter.FromHoursMS(1)) -- 3600000
```
