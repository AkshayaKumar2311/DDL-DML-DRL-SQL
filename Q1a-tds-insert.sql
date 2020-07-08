--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-tds-insert.sql
--Student ID: 31021301
--Student Name: Akshaya Kumar Chandrasekaran
--Tutorial No: 01
--Last edit : 08-06-2020
SET SERVEROUTPUT ON;


/* Comments for your marker:




*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    03,
    TO_DATE('02-Jan-2016', 'DD-MON-YYYY'),
    'New South Wales',
    102,
    10000009,
    100001,
    '1NXAE09E9PZ111066'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    05,
    TO_DATE('11-Feb-2016', 'DD-MON-YYYY'),
    'New South Wales',
    103,
    10000009,
    100001,
    '1NXAE09E9PZ111066'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    07,
    TO_DATE('17-Mar-2016', 'DD-MON-YYYY'),
    'New South Wales',
    104,
    10000010,
    100001,
    '1NXAE09E9PZ111066'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    09,
    TO_DATE('04-Apr-2016', 'DD-MON-YYYY'),
    'Perth',
    106,
    10000008,
    100313,
    'WBAGN63463D344800'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    11,
    TO_DATE('18-May-2016', 'DD-MON-YYYY'),
    'Perth',
    110,
    10000008,
    100313,
    'WBAGN63463D344800'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    13,
    TO_DATE('10-Jun-2017', 'DD-MON-YYYY'),
    'Perth',
    114,
    10000007,
    100313,
    'WDBCB34E9MA590583'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    15,
    TO_DATE('15-Jul-2017', 'DD-MON-YYYY'),
    'Perth',
    118,
    10000007,
    100313,
    'WBAGN63463D344800'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    17,
    TO_DATE('15-Aug-2017', 'DD-MON-YYYY'),
    'Canberra',
    99,
    10000017,
    100101,
    '5N1ED28T08C631303'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    19,
    TO_DATE('29-Sep-2017', 'DD-MON-YYYY'),
    'Canberra',
    100,
    10000013,
    100101,
    '5N1ED28T08C631303'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    21,
    TO_DATE('24-Oct-2017', 'DD-MON-YYYY'),
    'Canberra',
    101,
    10000007,
    100101,
    '5N1ED28T08C631303'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    23,
    TO_DATE('26-Nov-2018', 'DD-MON-YYYY'),
    'Adelaide',
    119,
    10000012,
    100153,
    '5XYKWDA70EG526849'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    25,
    TO_DATE('09-Dec-2018', 'DD-MON-YYYY'),
    'Adelaide',
    121,
    10000012,
    100185,
    'JA3AJ46EX2U027924'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    27,
    TO_DATE('01-Jan-2018', 'DD-MON-YYYY'),
    'Adelaide',
    123,
    10000002,
    100140,
    'ZHWEF4ZF2LLA13803'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    29,
    TO_DATE('14-Feb-2018', 'DD-MON-YYYY'),
    'Queensland',
    125,
    10000003,
    100181,
    '1B3BP68J8MN518050'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    31,
    TO_DATE('31-Mar-2018', 'DD-MON-YYYY'),
    'Queensland',
    127,
    10000013,
    100128,
    'WD8PD144765963886'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    33,
    TO_DATE('09-Jan-2019', 'DD-MON-YYYY'),
    'Tasmania',
    106,
    10000011,
    100011,
    '1Z7HT38N070010439'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    35,
    TO_DATE('06-Jan-2019', 'DD-MON-YYYY'),
    'Melbourne',
    131,
    10000021,
    100150,
    'WMWMF73509TV39579'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    37,
    TO_DATE('25-Feb-2019', 'DD-MON-YYYY'),
    'Tasmania',
    99,
    10000020,
    100105,
    'ZFFRG43A0R0096189'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    39,
    TO_DATE('28-Feb-2019', 'DD-MON-YYYY'),
    'Melbourne',
    106,
    10000021,
    100193,
    '5YJSA1AC8DFP10730'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    41,
    TO_DATE('05-Mar-2019', 'DD-MON-YYYY'),
    'Tasmania',
    114,
    10000020,
    100124,
    'JH2ME11104K000310'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    43,
    TO_DATE('09-Apr-2016', 'DD-MON-YYYY'),
    'Sydney',
    119,
    10000001,
    100254,
    'JHEFY1EUPA0010911'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    45,
    TO_DATE('06-May-2017', 'DD-MON-YYYY'),
    'Sydney',
    119,
    10000003,
    100255,
    'JALFVM23V67000169'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    47,
    TO_DATE('23-Jun-2018', 'DD-MON-YYYY'),
    'Sydney',
    119,
    10000004,
    100265,
    'JHEFY1EUPA0010911'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    49,
    TO_DATE('28-Jul-2018', 'DD-MON-YYYY'),
    'Sydney',
    125,
    10000005,
    100293,
    'JY4AH12W87C018399'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    51,
    TO_DATE('06-Aug-2017', 'DD-MON-YYYY'),
    'Sydney',
    127,
    10000006,
    100324,
    '1HGES26711L677266'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    53,
    TO_DATE('19-Aug-2018', 'DD-MON-YYYY'),
    'Clayton',
    100,
    10000016,
    100031,
    'KM8NU73C084029250'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    55,
    TO_DATE('21-Oct-2018', 'DD-MON-YYYY'),
    'Clayton',
    102,
    10000016,
    100031,
    'KM8NU73C084029250'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    57,
    TO_DATE('21-Jan-2019', 'DD-MON-YYYY'),
    'Clayton',
    102,
    10000018,
    100031,
    'WMWZN3C51DT568308'
);

COMMIT;

INSERT INTO offence (
    off_no,
    off_datetime,
    off_location,
    dem_code,
    officer_id,
    lic_no,
    veh_vin
) VALUES (
    59,
    TO_DATE('16-Feb-2019', 'DD-MON-YYYY'),
    'Tasmania',
    106,
    10000011,
    100011,
    '1Z7HT38N070010439'
);

COMMIT;

--Inserting values into suspension table

INSERT INTO suspension (
    lic_no,
    sus_date,
    sus_enddate
) VALUES (
    100001,
    TO_DATE('17-Mar-2016', 'DD-MON-YYYY'),
    TO_DATE('17-Sep-2017', 'DD-MON-YYYY')
);

COMMIT;

INSERT INTO suspension (
    lic_no,
    sus_date,
    sus_enddate
) VALUES (
    100313,
    TO_DATE('15-Jul-2017', 'DD-MON-YYYY'),
    TO_DATE('15-Jan-2018', 'DD-MON-YYYY')
);

COMMIT;

INSERT INTO suspension (
    lic_no,
    sus_date,
    sus_enddate
) VALUES (
    100101,
    TO_DATE('24-Oct-2017', 'DD-MON-YYYY'),
    TO_DATE('24-Apr-2018', 'DD-MON-YYYY')
);

COMMIT;

INSERT INTO suspension (
    lic_no,
    sus_date,
    sus_enddate
) VALUES (
    100031,
    TO_DATE('21-Jan-2019', 'DD-MON-YYYY'),
    TO_DATE('21-Jul-2019', 'DD-MON-YYYY')
);

COMMIT;