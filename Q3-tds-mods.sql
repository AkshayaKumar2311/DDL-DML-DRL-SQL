--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-tds-mods.sql
--Student ID: 31021301
--Student Name: Akshaya Kumar Chandrasekaran
--Tutorial No: 01

/* Comments for your marker:
I have assumed that only officer can revoke the offence.
So officer_id is a foreign key in my revocation table
*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

desc officer;

alter table officer 
add total_booked_offences number(8);

update officer oe 
set total_booked_offences = (select count(o.off_no) from offence o where oe.officer_id = o.officer_id)
where exists (select 1 from offence o where o.officer_id = oe.officer_id);

update officer oe
set total_booked_offences = 0
where not exists (select 1 from offence o where o.officer_id = oe.officer_id);

alter table officer
modify total_booked_offences number not null;


/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

alter table offence
add revocation_status varchar2(10);

Update offence
set revocation_status= 'No';

ALTER TABLE offence
    ADD CONSTRAINT chk_offence_rev_status CHECK ( revocation_status IN (
        'No',
        'Yes'
    ) );


drop table revoke_reason cascade constraints PURGE;
   
create table revoke_reason (
    reason_code         CHAR(3) NOT NULL,
    reason_description     VARCHAR2(100) NULL
    );
    
ALTER TABLE revoke_reason ADD CONSTRAINT revoke_reason_pk PRIMARY KEY ( reason_code );

insert into revoke_reason (reason_code, reason_description) values('FOS','First offence exceed speed limit by less than 10km/h');
insert into revoke_reason (reason_code, reason_description) values('FEU','Faulty equipment used');
insert into revoke_reason (reason_code, reason_description) values('DOU','Driver objection upheld');
insert into revoke_reason (reason_code, reason_description) values('COH','Court hearing');
insert into revoke_reason (reason_code, reason_description) values('EIP','Error in proceedings');

desc officer;
desc offence;

drop table revocation cascade constraints PURGE;

create table revocation(
    revocation_id         number(8) NOT NULL,
    revocation_date     date NOT NULL,
    officer_id   number(8) NOT NULL,
    reason_code   CHAR(3) NOT NULL,
    off_no number(8,0) NOT NULL
);

ALTER TABLE revocation ADD CONSTRAINT revocation_pk PRIMARY KEY ( revocation_id );


ALTER TABLE revocation
    ADD CONSTRAINT rev_offence FOREIGN KEY ( off_no )
        REFERENCES offence ( off_no );
        
ALTER TABLE revocation
    ADD CONSTRAINT revocation_reason FOREIGN KEY ( reason_code )
        REFERENCES revoke_reason ( reason_code );
        
ALTER TABLE revocation
    ADD CONSTRAINT revocation_officer FOREIGN KEY ( officer_id )
        REFERENCES officer ( officer_id );

/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE


drop table veh_outer_part cascade constraints purge;
   
CREATE TABLE veh_outer_part (
    veh_outer_part_code CHAR(2) NOT NULL,
    veh_outer_part_description VARCHAR2(100) NULL
    );
   
ALTER TABLE veh_outer_part ADD CONSTRAINT veh_otr_part_pk PRIMARY KEY ( veh_outer_part_code );

insert into veh_outer_part (veh_outer_part_code, veh_outer_part_description) values('SP','Spoiler');
commit;
insert into veh_outer_part (veh_outer_part_code, veh_outer_part_description) values('GR','Grilles');
commit;
insert into veh_outer_part (veh_outer_part_code, veh_outer_part_description) values('BM','Bumper');
commit;

drop sequence sequence_color;
create sequence sequence_color start with 1 increment by 1;

drop table colour cascade constraints PURGE;

CREATE TABLE colour (
    colour_code NUMBER(8,0) NOT NULL,
    colour_name VARCHAR2(100) NULL
    );

ALTER TABLE colour ADD CONSTRAINT clr_veh_pk PRIMARY KEY ( colour_code );
   
insert into colour(colour_code,colour_name)
select sequence_color.nextval,veh_maincolor from (select distinct veh_maincolor from vehicle);

commit;

drop table vehicle_part_colour cascade constraints PURGE;

CREATE TABLE VEHICLE_PART_colour (
    veh_vin CHAR(17) NOT NULL,
    veh_outer_part_code CHAR(2) NOT NULL,
    colour_code NUMBER(8,0) NOT NULL
    );
   
ALTER TABLE VEHICLE_PART_colour ADD CONSTRAINT colour_veh_part_pk PRIMARY KEY ( veh_vin,veh_outer_part_code );


ALTER TABLE VEHICLE_PART_colour
    ADD CONSTRAINT veh_vin_part FOREIGN KEY ( veh_vin )
        REFERENCES vehicle ( veh_vin );

ALTER TABLE VEHICLE_PART_colour
    ADD CONSTRAINT veh_part_vin FOREIGN KEY ( veh_outer_part_code )
        REFERENCES veh_outer_part (veh_outer_part_code );

ALTER TABLE VEHICLE_PART_colour
    ADD CONSTRAINT veh_part_colour FOREIGN KEY ( colour_code )
        REFERENCES colour (colour_code );


--Since the color 'Magenta' is not there in the data base, new colour is added 
insert into colour values (sequence_color.nextval,'Magenta');
commit;


insert into vehicle_part_colour values ((select veh_vin from vehicle where veh_vin = 'ZHWEF4ZF2LLA13803'),
(select veh_outer_part_code from veh_outer_part where veh_outer_part_code= 'GR'),(select colour_code from colour where colour_name='Magenta'));
commit;

insert into vehicle_part_colour values ((select veh_vin from vehicle where veh_vin = 'ZHWEF4ZF2LLA13803'),
(select veh_outer_part_code from veh_outer_part where veh_outer_part_code= 'SP'),(select colour_code from colour where colour_name='Black'));
commit;

insert into vehicle_part_colour values ((select veh_vin from vehicle where veh_vin = 'ZHWES4ZF8KLA12259'),
(select veh_outer_part_code from veh_outer_part where veh_outer_part_code= 'BM'),(select colour_code from colour where colour_name='Blue'));
commit;

insert into vehicle_part_colour values ((select veh_vin from vehicle where veh_vin = 'ZHWES4ZF8KLA12259'),
(select veh_outer_part_code from veh_outer_part where veh_outer_part_code= 'SP'),(select colour_code from colour where colour_name='Yellow'));
commit;

