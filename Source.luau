--!strict

local SecondInMinute = 60
local SecondInHour = SecondInMinute * 60
local SecondInDay = SecondInHour * 24
local SecondInWeek = SecondInDay * 7
local SecondInYear = SecondInDay * 365

local TimeConverter = {}
TimeConverter.__index = TimeConverter

type TimeConverterData = {
	Years: number,
	Months: number,
	Weeks: number,
	Days: number,
	Hours: number,
	Minutes: number,
	Seconds: number,
	Milliseconds: number,
	Counter: number,
}

export type TimeConverter = typeof(setmetatable({} :: TimeConverterData, TimeConverter))

function TimeConverter.New(): TimeConverter
	local self = {
		Years = 0,
		Months = 0,
		Weeks = 0,
		Days = 0,
		Hours = 0,
		Minutes = 0,
		Seconds = 0,
		Milliseconds = 0,
		Counter = 0,
	}
	return setmetatable(self, TimeConverter)
end

function TimeConverter.UpdateTimeConversions(self: TimeConverter)
	self.Seconds = self.Counter
	self.Milliseconds = self.Counter * 1000
	self.Minutes = self.Counter / SecondInMinute
	self.Hours = self.Counter / SecondInHour
	self.Days = self.Counter / SecondInDay
	self.Weeks = self.Counter / SecondInWeek
	self.Years = self.Counter / SecondInYear
end

function TimeConverter.AddSeconds(self: TimeConverter, Seconds: number): TimeConverter
	self.Counter += Seconds
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.AddMinutes(self: TimeConverter, Minutes: number): TimeConverter
	self.Counter += Minutes * SecondInMinute
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.AddHours(self: TimeConverter, Hours: number): TimeConverter
	self.Counter += Hours * SecondInHour
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.AddDays(self: TimeConverter, Days: number): TimeConverter
	self.Counter += Days * SecondInDay
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.AddWeeks(self: TimeConverter, Weeks: number): TimeConverter
	self.Counter += Weeks * SecondInWeek
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.AddYears(self: TimeConverter, Years: number): TimeConverter
	self.Counter += Years * SecondInYear
	self:UpdateTimeConversions()
	return self
end

function TimeConverter.FromSeconds(Seconds: number): number
	return TimeConverter.New():AddSeconds(Seconds).Seconds
end

function TimeConverter.FromMinutes(Minutes: number): number
	return TimeConverter.New():AddMinutes(Minutes).Seconds
end

function TimeConverter.FromHours(Hours: number): number
	return TimeConverter.New():AddHours(Hours).Seconds
end

function TimeConverter.FromDays(Days: number): number
	return TimeConverter.New():AddDays(Days).Seconds
end

function TimeConverter.FromWeeks(Weeks: number): number
	return TimeConverter.New():AddWeeks(Weeks).Seconds
end

function TimeConverter.FromYears(Years: number): number
	return TimeConverter.New():AddYears(Years).Seconds
end

function TimeConverter.FromSecondsMS(Seconds: number): number
	return TimeConverter.New():AddSeconds(Seconds).Milliseconds
end

function TimeConverter.FromMinutesMS(Minutes: number): number
	return TimeConverter.New():AddMinutes(Minutes).Milliseconds
end

function TimeConverter.FromHoursMS(Hours: number): number
	return TimeConverter.New():AddHours(Hours).Milliseconds
end

function TimeConverter.FromDaysMS(Days: number): number
	return TimeConverter.New():AddDays(Days).Milliseconds
end

function TimeConverter.FromWeeksMS(Weeks: number): number
	return TimeConverter.New():AddWeeks(Weeks).Milliseconds
end

function TimeConverter.FromYearsMS(Years: number): number
	return TimeConverter.New():AddYears(Years).Milliseconds
end

function TimeConverter.ToMilliseconds(SecondsValue: number): number
	return SecondsValue * 1000
end

function TimeConverter.ToSeconds(MillisecondsValue: number): number
	return MillisecondsValue / 1000
end

return TimeConverter
