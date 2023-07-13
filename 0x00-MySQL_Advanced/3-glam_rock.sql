-- Old school band
-- Requirements:
-- Import this table dump: metal_bands.sql.zip
-- Column names must be: band_name and lifespan (in years)
-- You should use attributes formed and split for computing the lifespan
-- Your script can be executed on any database

SELECT band_name, 
    (YEAR('2022-01-01') - YEAR(Formed)) - 
        CASE 
            WHEN MONTH('2022-01-01') < MONTH(Formed) THEN 1
            WHEN MONTH('2022-01-01') = MONTH(Formed) AND DAY('2022-01-01') < DAY(Formed) THEN 1
            ELSE 0
        END AS lifespan
    FROM metal_bands
    WHERE Style = 'Glam rock'
    ORDER BY lifespan DESC;
