SELECT * FROM Employees;

SELECT city, state_province, country_name
FROM Locations, Countries, Regions
WHERE Locations.country_id = Countries.country_id
  AND Countries.region_id = Regions.region_id
  AND region_name = 'Asia';