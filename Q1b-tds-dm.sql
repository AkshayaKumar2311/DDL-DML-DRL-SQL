--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-tds-dm.sql
--Student ID: 31021301
--Student Name: Akshaya Kumar Chandrasekaran
--Tutorial No: 01
--last edit: 05-06-2020

SET SERVEROUTPUT ON;


/* Comments for your marker:




*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE


DROP SEQUENCE offence_seq;

CREATE SEQUENCE offence_seq
START WITH 100
increment by 1;



/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

insert into offence (off_no, off_datetime, off_location, dem_code, officer_id, lic_no, veh_vin)
values(offence_seq.nextval, TO_DATE('25-Jan-2019 08:04:00', 'DD-MON-YYYY hh:mi:ss AM'), 'Albany', (select dem_code from DEMERIT where dem_description= 'Blood alcohol charge'), 10000011, 100389, 'JYA3HHE05RA070562');

commit;

insert into offence (off_no, off_datetime, off_location, dem_code, officer_id, lic_no, veh_vin)
values(offence_seq.nextval, TO_DATE('16-Oct-2019 21:00:00', 'DD-MON-YYYY HH24:mi:ss'), 'Albany', (select dem_code from DEMERIT where dem_description= 'Level crossing offence'), 10000015, 100389, 'JYA3HHE05RA070562');

commit;

insert into offence (off_no, off_datetime, off_location, dem_code, officer_id, lic_no, veh_vin)
values(offence_seq.nextval, TO_DATE('07-Jan-2020 07:07:00', 'DD-MON-YYYY HH:mi:ss AM'), 'Albany', (select dem_code from DEMERIT where dem_description= 'Exceeding the speed limit by 25 km/h or more'), 10000015, 100389, 'JYA3HHE05RA070562');

commit;

--select * from offence;

/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

--select to_char(off_datetime, 'DD-MON-YYYY HH:mi:ss AM') from offence 
--where  lic_no=100389 ;

UPDATE  offence
SET dem_code= (select dem_code from DEMERIT where dem_description= 'Exceeding the speed limit by 10 km/h or more but less than 25 km/h')
where lic_no=100389 and
to_char(off_datetime, 'DD-MON-YYYY HH:mi:ss AM')='07-JAN-2020 07:07:00 AM' and
dem_code= (select dem_code from DEMERIT where dem_description= 'Exceeding the speed limit by 25 km/h or more') ;
