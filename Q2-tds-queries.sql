--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-tds-queries.sql
--Student ID: 31021301
--Student Name: Akshaya Kumar Chandrasekaran
--Tutorial No: 01

/* Comments for your marker:

*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select dem_points as "Demerit Points",dem_description as "Demerit Description" from demerit
where dem_description like '%heavy%' or dem_description like '%Heavy%' or dem_description like 'Exceed%'
order by dem_points,dem_description;


/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select veh_maincolor as "Main Colour",veh_vin as "VIN",to_char(veh_yrmanuf,'yyyy') as "Year Manufactured" from vehicle
where veh_modname like 'Range Rover%' and
to_char(veh_yrmanuf,'yyyy') IN ('2012','2013','2014')
order by veh_yrmanuf desc,veh_maincolor;


/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select d.lic_no as "Licence No.",lic_fname || ' ' || lic_lname as "Driver Fullname",to_char(lic_dob,'dd-Mon-yyyy') as DOB,
lic_street || ' ' || lic_town || ' ' || lic_postcode as "Driver Address",s.sus_date as "Suspended On",s.sus_enddate as "Suspended Till"
from driver d
join suspension s
on d.lic_no = s.lic_no
where floor(months_between(sysdate, s.sus_date)) <= 30
order by d.lic_no,s.sus_date desc;

/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

select d.dem_code as "Demerit Code" ,d.dem_description as "Demerit Description",count(d.dem_code) as "Total Offences(All Months)", 
sum(case when to_char(o.off_datetime, 'Mon') = 'Jan' then 1 else 0 end) as "Jan",
sum(case when to_char(o.off_datetime, 'Mon') = 'Feb' then 1 else 0 end) as "Feb",
sum(case when to_char(o.off_datetime, 'Mon') = 'Mar' then 1 else 0 end) as "Mar",
sum(case when to_char(o.off_datetime, 'Mon') = 'Apr' then 1 else 0 end) as "Apr",
sum(case when to_char(o.off_datetime, 'Mon') = 'May' then 1 else 0 end) as "May",
sum(case when to_char(o.off_datetime, 'Mon') = 'Jun' then 1 else 0 end) as "Jun",
sum(case when to_char(o.off_datetime, 'Mon') = 'Jul' then 1 else 0 end) as "Jul",
sum(case when to_char(o.off_datetime, 'Mon') = 'Aug' then 1 else 0 end) as "Aug",
sum(case when to_char(o.off_datetime, 'Mon') = 'Sep' then 1 else 0 end) as "Sep",
sum(case when to_char(o.off_datetime, 'Mon') = 'Oct' then 1 else 0 end) as "Oct",
sum(case when to_char(o.off_datetime, 'Mon') = 'Nov' then 1 else 0 end) as "Nov",
sum(case when to_char(o.off_datetime, 'Mon') = 'Dec' then 1 else 0 end) as "Dec"
from demerit d 
join offence o 
on o.dem_code=d.dem_code
group by d.dem_code,d.dem_description
order by count(d.dem_code) desc,d.dem_code;



/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

--Sub-Query to find the maximum count
select max(count(veh_vin)) from offence group by veh_vin;

select v.veh_manufname as "Manufacturer Name",count(v.veh_vin) as "Total No. of Offences" from offence o
join demerit d
on d.dem_code = o.dem_code
join vehicle v  
on v.veh_vin = o.veh_vin
where d.dem_points >=2
group by v.veh_manufname,v.veh_vin
having count(v.veh_vin) IN (select max(count(veh_vin)) from offence group by veh_vin)
order by "Total No. of Offences" desc,"Manufacturer Name";


/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


--checking sub query 
Select  o.lic_no , o.dem_code,count(o.dem_code),d.lic_lname,d.lic_fname 
from offence o
join driver d
on o.lic_no = d.lic_no
group by o.lic_no , o.dem_code, d.lic_lname,d.lic_fname 
having count(o.dem_code) >1;

select count(lic_no) from offence
group by lic_no
having count(lic_no)>1;

--Query to get the desired output

select table_temp.lic_no as "License No.", table_temp.lic_fname || ' ' || table_temp.lic_lname as "Driver Name",
        f.officer_id   as "Officer ID",f.officer_fname || ' ' || f.officer_lname as "Officer Name"
from ( Select  o.lic_no , o.dem_code,count(o.dem_code),d.lic_lname,d.lic_fname 
from offence o
join driver d
on o.lic_no = d.lic_no
group by o.lic_no , o.dem_code, d.lic_lname,d.lic_fname 
having count(o.dem_code) >1) "TABLE_TEMP"
join offence o
on table_temp.lic_no = o.lic_no
join officer f
on o.officer_id = f.officer_id
where table_temp.lic_lname = f.officer_lname
group by table_temp.lic_no,table_temp.lic_fname,table_temp.lic_lname,f.officer_id,f.officer_fname,f.officer_lname
order by "License No.";



/*
2(vii) Query 7
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE

--Only max counts displayed.

select lictab.dem_code as "Demerit Code",d.dem_description as "Demerit Description",dr.lic_no as "Licence No.",
dr.lic_fname || ' ' ||dr.lic_lname as  "Driver Full Name",max(dem_count) as "Total Times Booked" from
(select dem_code , count(dem_code) as dem_count from offence group by dem_code,lic_no) lictab 
join offence o on o.dem_code=lictab.dem_code 
join driver dr on dr.lic_no = o.lic_no
join demerit d on d.dem_code=lictab.dem_code
group by lictab.dem_code,d.dem_description,dr.lic_no,dr.lic_fname,dr.lic_lname
order by "Demerit Code","Total Times Booked";

--All counts displayed

select d.dem_code,d.dem_description as "Demerit Description",dr.lic_no,dr.lic_fname || ' ' || dr.lic_lname as "Driver Fullname", 
count(*) as "Total Times Booked"
from demerit   d 
join offence   o
on o.dem_code = d.dem_code
join driver    dr
on dr.lic_no = o.lic_no
group by  d.dem_code,d.dem_description,dr.lic_no,dr.lic_fname,dr.lic_lname
order by d.dem_code,dr.lic_no;

/*
2(viii) Query 8
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE


select "Region", count(*) as "Total vehicles Manufactured", lpad(concat(to_char((count("Region") * 100/(select count(*) from vehicle)),'990.99') , '%'),27,' ') as "Percentage of Vehicles Manufactured"
from ( select
case
when substr(veh_vin, 1, 1) IN ('A','B','C') then 'Africa'
when substr(veh_vin, 1, 1) IN ('J','K','L','M','N','O','P','Q','R') then 'Asia'
when substr(veh_vin, 1, 1) IN ('S','T','U','V','W','X','Y','Z') then 'Europe'
when substr(veh_vin, 1, 1) IN ('1','2','3','4','5') then 'North America'
when substr(veh_vin, 1, 1) IN ('6','7') then 'Oceania'
when substr(veh_vin, 1, 1) IN ('8','9') then 'South America'
else 'Unknown'
end as "Region"
from vehicle)
group by "Region"

union

select lpad(to_char('TOTAL'),13,' '), sum(count("Region")) as "Total vehicles Manufactured", lpad(concat(sum(round(count("Region")* 100 /(select count(*) from vehicle),2)),'%'),27,' ') as "Percentage of Vehicles Manufactured" 
from (select case
when substr(veh_vin, 1, 1) in ('A','B','C') then 'Africa'
when substr(veh_vin, 1, 1) in ('J','K','L','M','N','O','P','Q','R') then 'Asia'
when substr(veh_vin, 1, 1) in ('S','T','U','V','W','X','Y','Z') then 'Europe'
when substr(veh_vin, 1, 1) in ('1','2','3','4','5') then 'North America'
when substr(veh_vin, 1, 1) in ('6','7') then 'Oceania'
when substr(veh_vin, 1, 1) in ('8','9') then 'South America'
else 'Unknown'
end as "Region" 
from vehicle)
group by "Region", 'TOTAL'
order by "Total vehicles Manufactured","Region";


