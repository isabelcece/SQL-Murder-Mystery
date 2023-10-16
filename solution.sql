--1. Find crime scene report record

 SELECT * FROM crime_scene_report
  WHERE type = 'murder' AND date = 20180115 AND city = 'SQL City'

--2. Find witness details

SELECT * FROM person
  WHERE address_street_name = "Northwestern Dr"
  ORDER BY address_number DESC 
  LIMIT 1;

SELECT * FROM person
  WHERE address_street_name = "Franklin Ave" 
  AND name LIKE "%Annabel%"

--3. Lookup witness interviews

SELECT * FROM interview
WHERE person_id = 16371 OR person_id = 14887

--4. Find the killer

SELECT p.name, p.id FROM get_fit_now_member AS m
INNER JOIN get_fit_now_check_in AS c ON m.id = c.membership_id
INNER JOIN person AS p on m.person_id = p.id
INNER JOIN drivers_license AS d ON p.license_id = d.id
WHERE m.id LIKE '48Z%' 
AND m.membership_status = 'gold'
AND check_in_date = 20180109 
AND plate_number LIKE '%H42W%'

--5. Lookup killer's interview

SELECT * FROM interview
WHERE person_id = 67318
              
--6. Find the real villain

SELECT p.id, p.name, f.event_name, f.date FROM person AS p
INNER JOIN drivers_license AS d ON p.license_id = d.id
INNER JOIN facebook_event_checkin AS f ON p.id = f.person_id
WHERE hair_color = 'red'
AND car_make = 'Tesla'
AND height BETWEEN 65 AND 67
