WITH country_region AS(
    SELECT DISTINCT
       *
    FROM {{source('Ronaldo','COUNTRYREGION')}}
)
SELECT * FROM country_region
