--Page 1 OF 6
/* Database Systems, Coronel/Morris */
/* Type of SQL : Oracle */
SET serveroutput ON;

--select * from vendor;

SET ESCAPE ON
CREATE TABLE VENDOR
  (
    V_CODE     INTEGER,
    V_NAME     VARCHAR(35) NOT NULL,
    V_CONTACT  VARCHAR(15) NOT NULL,
    V_AREACODE CHAR(3) NOT NULL,
    V_PHONE    CHAR(8) NOT NULL,
    V_STATE    CHAR(2) NOT NULL,
    V_ORDER    CHAR(1) NOT NULL
  );

--select * from product;

CREATE TABLE PRODUCT
  (
    P_CODE     VARCHAR2(10) CONSTRAINT PRODUCT_P_CODE_PK PRIMARY KEY,
    P_DESCRIPT VARCHAR2(35) NOT NULL,
    P_INDATE DATE NOT NULL,
    P_QOH       NUMBER NOT NULL,
    P_MIN       NUMBER NOT NULL,
    P_PRICE     NUMBER(8,2) NOT NULL,
    P_DISCOUNT  NUMBER(4,2) NOT NULL,
    V_CODE      NUMBER,
    P_MIN_ORDER NUMBER,
    P_REORDER   NUMBER
  );
  
 -- select * from customer;
  
CREATE TABLE CUSTOMER
  (
    CUS_CODE     NUMBER PRIMARY KEY,
    CUS_LNAME    VARCHAR(15) NOT NULL,
    CUS_FNAME    VARCHAR(15) NOT NULL,
    CUS_INITIAL  CHAR(1),
    CUS_AREACODE CHAR(3) DEFAULT '615' NOT NULL CHECK(CUS_AREACODE IN ('615','713','931')),
    CUS_PHONE    CHAR(8) NOT NULL,
    CUS_BALANCE  NUMBER(9,2) DEFAULT 0.00
  );

  CREATE TABLE CUSTOMER_2
  (
    CUS_CODE     NUMBER PRIMARY KEY,
    CUS_LNAME    VARCHAR(15) NOT NULL,
    CUS_FNAME    VARCHAR(15) NOT NULL,
    CUS_INITIAL  CHAR(1),
    CUS_AREACODE CHAR(3) DEFAULT '615' NOT NULL,
    CUS_PHONE    CHAR(8) NOT NULL,
    CUS_BALANCE  NUMBER(9,2) DEFAULT 0.00
  );
  
  
 -- select * from customer;
  
CREATE TABLE INVOICE
  (
    INV_NUMBER NUMBER PRIMARY KEY,
    CUS_CODE   NUMBER NOT NULL REFERENCES CUSTOMER(CUS_CODE),
    INV_DATE DATE DEFAULT SYSDATE NOT NULL
  );
  
 --select * from invoice; 
 
 --select * from line; 
  
CREATE TABLE LINE
  (
    INV_NUMBER  NUMBER NOT NULL,
    LINE_NUMBER NUMBER(2,0) NOT NULL,
    P_CODE      VARCHAR(10) NOT NULL,
    LINE_UNITS  NUMBER(9,2) DEFAULT 0.00 NOT NULL,
    LINE_PRICE  NUMBER(9,2) DEFAULT 0.00 NOT NULL
  );
  
  
  
CREATE TABLE EMPLOYEE
  (
    EMP_NUM     NUMBER PRIMARY KEY,
    EMP_TITLE   CHAR(10),
    EMP_LNAME   VARCHAR(15) NOT NULL,
    EMP_FNAME   VARCHAR(15) NOT NULL,
    EMP_INITIAL CHAR(1),
    EMP_DOB DATE,
    EMP_HIRE_DATE DATE,
    EMP_AREACODE CHAR(3),
    EMP_PHONE    CHAR(8)
  );
CREATE TABLE EMP
  (
    EMP_NUM     NUMBER PRIMARY KEY,
    EMP_TITLE   CHAR(10),
    EMP_LNAME   VARCHAR(15) NOT NULL,
    EMP_FNAME   VARCHAR(15) NOT NULL,
    EMP_INITIAL CHAR(1),
    EMP_DOB DATE,
    EMP_HIRE_DATE DATE,
    EMP_AREACODE CHAR(3),
    EMP_PHONE    CHAR(8),
    EMP_MGR      NUMBER
  );
/* VENDOR rows                                */
INSERT
INTO VENDOR VALUES
  (
    21225,
    'Bryson, Inc.' ,
    'Smithson',
    '615',
    '223-3234',
    'TN',
    'Y'
  );
INSERT
INTO VENDOR VALUES
  (
    21226,
    'SuperLoo, Inc.' ,
    'Flushing',
    '904',
    '215-8995',
    'FL',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    21231,
    'D\&E Supply' ,
    'Singh' ,
    '615',
    '228-3245',
    'TN',
    'Y'
  );
INSERT
INTO VENDOR VALUES
  (
    21344,
    'Gomez Bros.' ,
    'Ortega' ,
    '615',
    '889-2546',
    'KY',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    22567,
    'Dome Supply' ,
    'Smith' ,
    '901',
    '678-1419',
    'GA',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    23119,
    'Randsets Ltd.' ,
    'Anderson',
    '901',
    '678-3998',
    'GA',
    'Y'
  );
INSERT
INTO VENDOR VALUES
  (
    24004,
    'Brackman Bros.' ,
    'Browning',
    '615',
    '228-1410',
    'TN',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    24288,
    'ORDVA, Inc.' ,
    'Hakford' ,
    '615',
    '898-1234',
    'TN',
    'Y'
  );
INSERT
INTO VENDOR VALUES
  (
    25443,
    'B\&K, Inc.' ,
    'Smith' ,
    '904',
    '227-0093',
    'FL',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    25501,
    'Damal Supplies' ,
    'Smythe' ,
    '615',
    '890-3529',
    'TN',
    'N'
  );
INSERT
INTO VENDOR VALUES
  (
    25595,
    'Rubicon Systems' ,
    'Orton' ,
    '904',
    '456-0092',
    'FL',
    'Y'
  );
/* PRODUCT rows                               */
INSERT
INTO PRODUCT VALUES
  (
    '11QER/31',
    'Power painter, 15 psi., 3-nozzle' ,
    '03-NOV-2017',
    8,
    5,
    109.99,
    0.00,
    25595,
    25,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '13-Q2/P2',
    '7.25-in. pwr. saw blade' ,
    '13-DEC-2017',
    32,
    15,
    14.99,
    0.05,
    21344,
    50,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '14-Q1/L3',
    '9.00-in. pwr. saw blade' ,
    '13-NOV-2017',
    18,
    12,
    17.49,
    0.00,
    21344,
    50,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '1546-QQ2',
    'Hrd. cloth, 1/4-in., 2x50' ,
    '15-JAN-2018',
    15,
    8,
    39.95,
    0.00,
    23119,
    35,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '1558-QW1',
    'Hrd. cloth, 1/2-in., 3x50' ,
    '15-JAN-2018',
    23,
    5,
    43.99,
    0.00,
    23119,
    25,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '2232/QTY',
    'B\&D jigsaw, 12-in. blade' ,
    '30-DEC-2017',
    8,
    5,
    109.92,
    0.05,
    24288,
    15,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '2232/QWE',
    'B\&D jigsaw, 8-in. blade' ,
    '24-DEC-2017',
    6,
    5,
    99.87,
    0.05,
    24288,
    15,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '2238/QPD',
    'B\&D cordless drill, 1/2-in.' ,
    '20-JAN-2018',
    12,
    5,
    38.95,
    0.05,
    25595,
    12,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '23109-HB',
    'Claw hammer' ,
    '20-JAN-2018',
    23,
    10,
    9.95,
    0.10,
    21225,
    25,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '23114-AA',
    'Sledge hammer, 12 lb.' ,
    '02-JAN-2018',
    8,
    5,
    14.40,
    0.05,
    NULL ,
    12,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '54778-2T',
    'Rat-tail file, 1/8-in. fine' ,
    '15-DEC-2017',
    43,
    20,
    4.99,
    0.00,
    21344,
    25,0
  );
INSERT
INTO PRODUCT VALUES
  (
    '89-WRE-Q',
    'Hicut chain saw, 16 in.' ,
    '07-FEB-2018',
    11,
    5,
    256.99,
    0.05,
    24288,
    10,0
  );
INSERT
INTO PRODUCT VALUES
  (
    'PVC23DRT',
    'PVC pipe, 3.5-in., 8-ft' ,
    '20-FEB-2018',
    188,
    75,
    5.87,
    0.00,
    NULL ,
    50,0
  );
INSERT
INTO PRODUCT VALUES
  (
    'SM-18277',
    '1.25-in. metal screw, 25' ,
    '01-MAR-2018',
    172,
    75,
    6.99,
    0.00,
    21225,
    50,0
  );
INSERT
INTO PRODUCT VALUES
  (
    'SW-23116',
    '2.5-in. wd. screw, 50' ,
    '24-FEB-2018',
    237,100,
    8.45,
    0.00,
    21231,100,0
  );
INSERT
INTO PRODUCT VALUES
  (
    'WR3/TT3' ,
    'Steel matting, 4''x8''x1/6", .5" mesh',
    '17-JAN-2018',
    18,
    5,
    119.95,
    0.10,
    25595,
    10,0
  );
/* CUSTOMER rows                        */
INSERT
INTO CUSTOMER VALUES
  (
    10010,
    'Ramas' ,
    'Alfred',
    'A' ,
    '615',
    '844-2573',
    0
  );
INSERT
INTO CUSTOMER VALUES
  (
    10011,
    'Dunne' ,
    'Leona' ,
    'K' ,
    '713',
    '894-1238',
    0
  );
INSERT
INTO CUSTOMER VALUES
  (
    10012,
    'Smith' ,
    'Kathy' ,
    'W' ,
    '615',
    '894-2285',
    345.86
  );
INSERT
INTO CUSTOMER VALUES
  (
    10013,
    'Olowski' ,
    'Paul' ,
    'F' ,
    '615',
    '894-2180',
    536.75
  );
INSERT
INTO CUSTOMER VALUES
  (
    10014,
    'Orlando' ,
    'Myron' ,
    NULL,
    '615',
    '222-1672',
    0
  );
INSERT
INTO CUSTOMER VALUES
  (
    10015,
    'O''Brian',
    'Amy' ,
    'B' ,
    '713',
    '442-3381',
    0
  );
INSERT
INTO CUSTOMER VALUES
  (
    10016,
    'Brown' ,
    'James' ,
    'G' ,
    '615',
    '297-1228',
    221.19
  );
INSERT
INTO CUSTOMER VALUES
  (
    10017,
    'Williams',
    'George',
    NULL,
    '615',
    '290-2556',
    768.93
  );
INSERT
INTO CUSTOMER VALUES
  (
    10018,
    'Farriss' ,
    'Anne' ,
    'G' ,
    '713',
    '382-7185',
    216.55
  );
INSERT
INTO CUSTOMER VALUES
  (
    10019,
    'Smith' ,
    'Olette',
    'K' ,
    '615',
    '297-3809',
    0
  );
/* CUSTOMER_2 rows                            */
INSERT
INTO CUSTOMER_2 VALUES
  (
    345,
    'Terrell',
    'Justine',
    'H',
    '615',
    '322-9870',
    0
  );
INSERT INTO CUSTOMER_2 VALUES
  (
    347,
    'Olowski',
    'Paul',
    'F',
    '615',
    '894-2180',
    0
  );
INSERT
INTO CUSTOMER_2 VALUES
  (
    351,
    'Hernandez',
    'Carlos',
    'J',
    '723',
    '123-7654',
    0
  );
INSERT
INTO CUSTOMER_2 VALUES
  (
    352,
    'McDowell',
    'George',
    NULL,
    '723',
    '123-7768',
    0
  );
INSERT INTO CUSTOMER_2 VALUES
  (
    365,
    'Tirpin',
    'Khaleed',
    'G',
    '723',
    '123-9876',
    0
  );
INSERT INTO CUSTOMER_2 VALUES
  (
    368,
    'Lewis',
    'Marie',
    'J',
    '734',
    '332-1789',
    0
  );
INSERT INTO CUSTOMER_2 VALUES
  (
    369,
    'Dunne',
    'Leona',
    'K',
    '713',
    '894-1238',
    0
  );
/* INVOICE rows                               */

--select * from invoice;

INSERT
INTO INVOICE VALUES
  (
    1001,10014,
    '16-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1002,10011,'16-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1003,10012,'16-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1004,10011,'17-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1005,10018,'17-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1006,10014,'17-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1007,10015,'17-JAN-2018'
  );
INSERT INTO INVOICE VALUES
  (1008,10011,'17-JAN-2018'
  );
/* LINE rows                                  */
INSERT
INTO LINE VALUES
  (
    1001,1,
    '13-Q2/P2',
    1,
    14.99
  );
  
  --select * from line;
  
INSERT INTO LINE VALUES
  (1001,2,'23109-HB',1,9.95
  );
INSERT INTO LINE VALUES
  (1002,1,'54778-2T',2,4.99
  );
INSERT INTO LINE VALUES
  (1003,1,'2238/QPD',1,38.95
  );
INSERT INTO LINE VALUES
  (1003,2,'1546-QQ2',1,39.95
  );
INSERT INTO LINE VALUES
  (1003,3,'13-Q2/P2',5,14.99
  );
INSERT INTO LINE VALUES
  (1004,1,'54778-2T',3,4.99
  );
INSERT INTO LINE VALUES
  (1004,2,'23109-HB',2,9.95
  );
INSERT INTO LINE VALUES
  (1005,1,'PVC23DRT',12,5.87
  );
INSERT INTO LINE VALUES
  (1006,1,'SM-18277',3,6.99
  );
INSERT INTO LINE VALUES
  (1006,2,'2232/QTY',1,109.92
  );
INSERT INTO LINE VALUES
  (1006,3,'23109-HB',1,9.95
  );
INSERT INTO LINE VALUES
  (1006,4,'89-WRE-Q',1,256.99
  );
INSERT INTO LINE VALUES
  (1007,1,'13-Q2/P2',2,14.99
  );
INSERT INTO LINE VALUES
  (1007,2,'54778-2T',1,4.99
  );
INSERT INTO LINE VALUES
  (1008,1,'PVC23DRT',5,5.87
  );
INSERT INTO LINE VALUES
  (1008,2,'WR3/TT3',3,119.95
  );
INSERT INTO LINE VALUES
  (1008,3,'23109-HB',1,9.95
  );
/* EMP rows                             */

--select * from emp;


INSERT
INTO EMP VALUES
  (
    100,
    'Mr.' ,
    'Kolmycz' ,
    'George' ,
    'D' ,
    '15-JUN-1942',
    '15-MAR-1985',
    '615',
    '324-5456',
    NULL
  );
INSERT
INTO EMP VALUES
  (
    101,
    'Ms.' ,
    'Lewis' ,
    'Rhonda' ,
    'G' ,
    '19-MAR-1965',
    '25-APR-1986',
    '615',
    '324-4472',
    100
  );
INSERT
INTO EMP VALUES
  (
    102,
    'Mr.' ,
    'Vandam' ,
    'Rhett' ,
    NULL,
    '14-NOV-1958',
    '20-DEC-1990',
    '901',
    '675-8993',
    100
  );
INSERT
INTO EMP VALUES
  (
    103,
    'Ms.' ,
    'Jones' ,
    'Anne' ,
    'M' ,
    '16-OCT-1974',
    '28-AUG-1994',
    '615',
    '898-3456',
    100
  );
INSERT
INTO EMP VALUES
  (
    104,
    'Mr.' ,
    'Lange' ,
    'John' ,
    'P' ,
    '08-NOV-1971',
    '20-OCT-1994',
    '901',
    '504-4430',
    105
  );
INSERT
INTO EMP VALUES
  (
    105,
    'Mr.' ,
    'Williams' ,
    'Robert' ,
    'D' ,
    '14-MAR-1975',
    '08-NOV-1998',
    '615',
    '890-3220',
    NULL
  );
INSERT
INTO EMP VALUES
  (
    106,
    'Mrs.',
    'Smith' ,
    'Jeanine',
    'K' ,
    '12-FEB-1968',
    '05-JAN-1989',
    '615',
    '324-7883',
    105
  );
INSERT
INTO EMP VALUES
  (
    107,
    'Mr.' ,
    'Diante' ,
    'Jorge' ,
    'D' ,
    '21-AUG-1974',
    '02-JUL-1994',
    '615',
    '890-4567',
    105
  );
INSERT
INTO EMP VALUES
  (
    108,
    'Mr.' ,
    'Wiesenbach',
    'Paul' ,
    'R' ,
    '14-FEB-1966',
    '18-NOV-1992',
    '615',
    '897-4358',
    NULL
  );
INSERT
INTO EMP VALUES
  (
    109,
    'Mr.' ,
    'Smith' ,
    'George' ,
    'K' ,
    '18-JUN-1961',
    '14-APR-1989',
    '901',
    '504-3339',
    108
  );
INSERT
INTO EMP VALUES
  (
    110,
    'Mrs.',
    'Genkazi' ,
    'Leighla',
    'W' ,
    '19-MAY-1970',
    '01-DEC-1990',
    '901',
    '569-0093',
    108
  );
INSERT
INTO EMP VALUES
  (
    111,
    'Mr.' ,
    'Washington',
    'Rupert' ,
    'E' ,
    '03-JAN-1966',
    '21-JUN-1993',
    '615',
    '890-4925',
    105
  );
INSERT
INTO EMP VALUES
  (
    112,
    'Mr.' ,
    'Johnson' ,
    'Edward' ,
    'E' ,
    '14-MAY-1961',
    '01-DEC-1983',
    '615',
    '898-4387',
    100
  );
INSERT
INTO EMP VALUES
  (
    113,
    'Ms.' ,
    'Smythe' ,
    'Melanie',
    'P' ,
    '15-SEP-1970',
    '11-MAY-1999',
    '615',
    '324-9006',
    105
  );
INSERT
INTO EMP VALUES
  (
    114,
    'Ms.' ,
    'Brandon' ,
    'Marie' ,
    'G' ,
    '02-NOV-1956',
    '15-NOV-1979',
    '901',
    '882-0845',
    108
  );
INSERT
INTO EMP VALUES
  (
    115,
    'Mrs.',
    'Saranda' ,
    'Hermine',
    'R' ,
    '25-JUL-1972',
    '23-APR-1993',
    '615',
    '324-5505',
    105
  );
INSERT
INTO EMP VALUES
  (
    116,
    'Mr.' ,
    'Smith' ,
    'George' ,
    'A' ,
    '08-NOV-1965',
    '10-DEC-1988',
    '615',
    '890-2984',
    108
  );
/* EMPLOYEE rows                        */
INSERT
INTO EMPLOYEE VALUES
  (
    100,
    'Mr.' ,
    'Kolmycz' ,
    'George' ,
    'D' ,
    '15-JUN-1942',
    '15-MAR-1985',
    '615',
    '324-5456'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    101,
    'Ms.' ,
    'Lewis' ,
    'Rhonda' ,
    'G' ,
    '19-MAR-1965',
    '25-APR-1986',
    '615',
    '324-4472'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    102,
    'Mr.' ,
    'Vandam' ,
    'Rhett' ,
    NULL,
    '14-NOV-1958',
    '20-DEC-1990',
    '901',
    '675-8993'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    103,
    'Ms.' ,
    'Jones' ,
    'Anne' ,
    'M' ,
    '16-OCT-1974',
    '28-AUG-1994',
    '615',
    '898-3456'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    104,
    'Mr.' ,
    'Lange' ,
    'John' ,
    'P' ,
    '08-NOV-1971',
    '20-OCT-1994',
    '901',
    '504-4430'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    105,
    'Mr.' ,
    'Williams' ,
    'Robert' ,
    'D' ,
    '14-MAR-1975',
    '08-NOV-1998',
    '615',
    '890-3220'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    106,
    'Mrs.',
    'Smith' ,
    'Jeanine',
    'K' ,
    '12-FEB-1968',
    '05-JAN-1989',
    '615',
    '324-7883'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    107,
    'Mr.' ,
    'Diante' ,
    'Jorge' ,
    'D' ,
    '21-AUG-1974',
    '02-JUL-1994',
    '615',
    '890-4567'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    108,
    'Mr.' ,
    'Wiesenbach',
    'Paul' ,
    'R' ,
    '14-FEB-1966',
    '18-NOV-1992',
    '615',
    '897-4358'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    109,
    'Mr.' ,
    'Smith' ,
    'George' ,
    'K' ,
    '18-JUN-1961',
    '14-APR-1989',
    '901',
    '504-3339'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    110,
    'Mrs.',
    'Genkazi' ,
    'Leighla',
    'W' ,
    '19-MAY-1970',
    '01-DEC-1990',
    '901',
    '569-0093'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    111,
    'Mr.' ,
    'Washington',
    'Rupert' ,
    'E' ,
    '03-JAN-1966',
    '21-JUN-1993',
    '615',
    '890-4925'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    112,
    'Mr.' ,
    'Johnson' ,
    'Edward' ,
    'E' ,
    '14-MAY-1961',
    '01-DEC-1983',
    '615',
    '898-4387'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    113,
    'Ms.' ,
    'Smythe' ,
    'Melanie',
    'P' ,
    '15-SEP-1970',
    '11-MAY-1999',
    '615',
    '324-9006'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    114,
    'Ms.' ,
    'Brandon' ,
    'Marie' ,
    'G' ,
    '02-NOV-1956',
    '15-NOV-1979',
    '901',
    '882-0845'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    115,
    'Mrs.',
    'Saranda' ,
    'Hermine',
    'R' ,
    '25-JUL-1972',
    '23-APR-1993',
    '615',
    '324-5505'
  );
INSERT
INTO EMPLOYEE VALUES
  (
    116,
    'Mr.' ,
    'Smith' ,
    'George' ,
    'A' ,
    '08-NOV-1965',
    '10-DEC-1988',
    '615',
    '890-2984'
  );
COMMIT;

--select * from employee;