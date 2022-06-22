--- To view the content of the dataset
select * from public."police_deaths_in_america";

--- To view the total number of deaths
select count("Name") 
from public."police_deaths_in_america";

--- To view the ranks of the policemen that died
select distinct ("Rank") 
from public."police_deaths_in_america";

--- To view the cause of death of the policemen
select distinct "Cause_of_Death" 
from public."police_deaths_in_america";

--- To view the total number of cause of death
select count(distinct "Cause_of_Death")
from public."police_deaths_in_america";

--- To view the count of policemen by cause of death
select "Cause_of_Death", count("Name") as count_of_police
from public."police_deaths_in_america"
group by 1
order by 2 desc;

--- To view the top 5 cause of death
select "Cause_of_Death", count("Cause_of_Death") as count_of_death
from public."police_deaths_in_america"
group by 1
order by 2 desc
limit 5;

--- To view the bottom 5 cause of death
select "Cause_of_Death", count("Cause_of_Death") as count_of_death 
from public."police_deaths_in_america"
group by 1
order by 2 asc
limit 5;

--- To view the total number of deaths by Rank
select "Rank", count("Name") as number_of_deaths
from public."police_deaths_in_america"
group by 1
order by 2 desc;
	
--- To view top 5 death by Rank
select "Rank", count("Name") as number_of_deaths from public."police_deaths_in_america"
group by 1
order by 2 desc
limit 5;

--- To view top 5 number of death by State
select "State", count("Name") as number_of_deaths 
from public."police_deaths_in_america"
group by 1
order by 2 desc
limit 5;

--- To view the bottom 5 State by death
select "State", count("Name") as number_of_deaths 
from public."police_deaths_in_america"
group by 1
order by 2 asc
limit 5;	
	
--- To view the cause of death and its number in the State, Michigan
select "State", "Cause_of_Death", count("Cause_of_Death") as number_of_deaths 
from public."police_deaths_in_america"
where "State" = 'Michigan'
group by 1, 2;
	
--- To view the policemen that died in Texas Rangers, TX Department
select "Name", "Department" from public."police_deaths_in_america"
where "Department" = 'Texas Rangers, TX';

---To view the dead policemen named Robert and their State
select "Name","State" from public."police_deaths_in_america"
where "Name" like '%Robert%';

--- To view the date of death and the number of deaths in descending order
select "Date", count("Date") as death_count
from public."police_deaths_in_america" 
group by 1
order by 2 desc;

--- To view the top 5 date and department that recorded the highest number of death
select "Date","Department", count("Date")as death_count from public."police_deaths_in_america"
group by 1, 2
order by 3 desc
limit 5;

--- To view the name and rank of policemen that died between the year 1900 and 2000
select "Rank", "Name", "Date" from public."police_deaths_in_america"
where "Date" between '1900-01-01' and '2000-12-31';

--- To view the number of policemen that died from 1999 and above 
select count("Date") as count_of_death 
from public."police_deaths_in_america"
where "Date" >= '1999-01-01'; 

--- To view the total death count of Police ranks per day, month in a year
select "Rank", count("Rank")as rank_count, extract(year from "Date") as Year, 
extract(month from "Date") as Month,
extract(day from "Date" ) as Day
from public."police_deaths_in_america"
group by 1,3,4,5
order by 2 desc; 

--- To view the department that had more than 10 death record
select "Department", "Date", count("Name")as number_of_death
from public."police_deaths_in_america"
group by 1,2
having count("Name") > 10;



