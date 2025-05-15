-- Get all info from the murder
select *
from crime_scene_report
where city like 'SQL City' and date = 20180115 and type like 'murder';

-- description: Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

-- Get the first witness
select *
from person
where address_street_name like 'Northwestern Dr' order by address_number desc limit 1;

-- id: 14887
-- name: Morty Schapiro
-- license_id: 118009
-- address_number: 4919
-- address_street_name: Northwestern Dr
-- ssn: 111564949

--Interview Morty Schapiro
select *
from interview
where person_id = 14887;

-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".

-- Get all members of the gym that fit the description
select *
from get_fit_now_member
where membership_status like 'gold' and id like '48Z%'; 

-- id:          48Z7A        | 48Z55
-- person_id:   28819        | 67318
-- name:        Joe Germuska | Jeremy Bowers

-- Get all their data
select *
from person
where id = 28819 or id = 67318;

-- id	    name	        license_id	address_number	address_street_name	    ssn
-- 28819	Joe Germuska	173289	    111	            Fisk Rd	                138909730
-- 67318	Jeremy Bowers	423327	    530	            Washington Pl, Apt 3A	871539279

-- Get all data from the one that drives a car with a plate that includes "H42W"
select *
from drivers_license
where (id = 173289 or id = 423327) and plate_number like '%H42W%';

-- id	    age	    height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 423327	30	    70	    brown	    brown	    male	0H42W2	        Chevrolet	Spark LS

-- 1st answer: Jeremy Bowers
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
-- Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.

select *
from interview
where person_id = 67318;
-- I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

-- Get all personal data
select person.*
from drivers_license
join person on person.license_id = drivers_license.id
where drivers_license.car_make = 'Tesla' and drivers_license.car_model = 'Model S'
	and drivers_license.hair_color = 'red' and drivers_license.height between 65 and 67
	and drivers_license.gender = 'female';
-- id	    name	            license_id	address_number	address_street_name	ssn
-- 78881	Red Korb	        918773	    107	            Camerata Dr	        961388910
-- 90700	Regina George	    291182	    332	            Maple Ave	        337169072
-- 99716	Miranda Priestly	202298	    1883	        Golden Ave	        987756388

select *
from facebook_event_checkin
where person_id in (78881, 90700, 99716) and event_name = 'SQL Symphony Concert';

-- person_id	event_id	event_name	            date
-- 99716	    1143	    SQL Symphony Concert	20171206
-- 99716	    1143	    SQL Symphony Concert	20171212
-- 99716	    1143	    SQL Symphony Concert	20171229

-- 2nd answer: Miranda Priestly
INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;

-- Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest SQL detective of all time. Time to break out the champagne!