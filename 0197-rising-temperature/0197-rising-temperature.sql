WITH PreviousWeatherData AS
(
    SELECT 
        id,
        recordDate,
        temperature, 
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS PreviousTemperature,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS PreviousRecordDate
    FROM 
        Weather
)

SELECT
ID
FROM PreviousWeatherData
WHERE 
temperature > PreviousTemperature
AND
Recorddate = Date_ADD(PreviousRecordDate, Interval 1 Day)