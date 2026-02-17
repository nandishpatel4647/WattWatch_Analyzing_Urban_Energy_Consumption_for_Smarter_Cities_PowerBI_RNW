Create database smartcity_db;
use smartcity_db;

SELECT 
    Zone,
    SUM(EnergyConsumed_kWh) AS TotalEnergy,
    AVG(EnergyConsumed_kWh) AS AvgEnergy
FROM SmartCityEnery
GROUP BY Zone;

SELECT 
    ConsumerType,
    MeterID,
    SUM(EnergyConsumed_kWh) AS TotalConsumption
FROM SmartCityEnery
GROUP BY ConsumerType, MeterID
ORDER BY TotalConsumption DESC
LIMIT 5;

SELECT 
    Zone,
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(EnergyConsumed_kWh) AS MonthlyConsumption
FROM SmartCityEnery
GROUP BY Zone, Month
ORDER BY Month;

SELECT 
    Zone,
    AVG(EnergyConsumed_kWh * TariffRate) AS AvgCost
FROM SmartCityEnery
GROUP BY Zone;

SELECT 
    MeterID,
    SUM(OutageMinutes) AS TotalOutage,
    COUNT(CASE WHEN MeterStatus = 'Faulty' THEN 1 END) AS FaultCount
FROM SmartCityEnery
GROUP BY MeterID
ORDER BY TotalOutage DESC
LIMIT 10;


SELECT 
    Zone,
    AVG(EnergyConsumed_kWh) AS AvgUsage,
    AVG(OutageMinutes) AS AvgOutage
FROM SmartCityEnery
GROUP BY Zone
ORDER BY AvgUsage DESC, AvgOutage DESC;

SELECT 
    CASE 
        WHEN DAYOFWEEK(Date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS DayType,
    AVG(PeakUsage_kWh) AS AvgPeakUsage
FROM SmartCityEnery
GROUP BY DayType;

