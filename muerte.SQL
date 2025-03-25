select * from crime_scene_report
WHERE date=20180115 and type= 'murder' and city='SQL City'

date	    type	description	                                  city
20180115	murder	Security footage shows that there were       SQL City
                   2 witnesses. The first witness lives at the 
                   last house on "Northwestern Dr". The second 
                   witness, named Annabel, lives somewhere on 
                   "Franklin Ave".	


select * from person
WHERE address_street_name = 'Northwestern Dr'
order by address_number desc limit 1

id	name	license_id	address_number	address_street_name	ssn
14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949


select * from person
WHERE (name like 'Annabel%' ) and address_street_name = 'Franklin Ave'

id	name	license_id	address_number	address_street_name	ssn
16371	Annabel Miller	490173	103	Franklin Ave	318771143

select * from interview  
INNER Join person on interview.person_id = person.id
WHERE id=16371

person_id	transcript	id	name	license_id	address_number	address_street_name	ssn
16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.	16371	Annabel Miller	490173	103	Franklin Ave	318771143


select * from interview i 
INNER Join person p on i.person_id = p.id
WHERE p.name like "Morty Schapiro"

person_id	transcript	id	name	license_id	address_number	address_street_name	ssn
14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". 
Only gold members have those bags. The man got into a car with a plate that included "H42W".	

14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949

select * from drivers_license dl
INNER Join person p on dl.id = p.license_id
WHERE dl.plate_number like "H42W%"

id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	id	name	license_id	address_number	address_street_name	ssn
183779	21	65	blue	blonde	female	H42W0X	Toyota	Prius	78193	Maxine Whitely	183779	110	Fisk Rd	137882671

select * from get_fit_now_check_in
WHERE (check_in_date like '20180109')

select * from drivers_license dl
INNER Join person p on dl.id = p.license_id
INNER JOIN get_fit_now_member gm ON gm.person_id = p.id
WHERE dl.plate_number like "%H42W%" AND gm.id like '48Z%' AND membership_status = 'gold'
 
 id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	id	name	license_id	address_number	address_street_name	ssn	id	person_id	name	membership_start_date	membership_status
423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS	67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279	48Z55	67318	Jeremy Bowers	20160101	gold

select * from drivers_license dl
INNER JOIN person p ON p.license_id = dl.id
WHERE  hair_color= 'red' and car_make like'tesla' AND (height = 65 OR height =67)

id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	id	name	license_id	address_number	address_street_name	ssn
918773	48	65	black	red	female	917UU3	Tesla	Model S	78881	Red Korb	918773	107	Camerata Dr	961388910

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;

        Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.