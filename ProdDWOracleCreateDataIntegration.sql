-- drop existing tables;
-- Only need to drop tables if you have previously created them

DROP TABLE W_ERROR_LOG;
DROP TABLE W_JOB_CHANGE_DATA;

-- drop existing sequences...

DROP SEQUENCE W_JOB_SEQ;
DROP SEQUENCE W_ERROR_LOG_SEQ;

--Set Date format--

ALTER SESSION set nls_date_format = 'yyyy-mm-dd';

-- create sequences...

CREATE SEQUENCE W_Job_Seq START WITH 1000000 INCREMENT BY 1;
CREATE SEQUENCE W_Error_Log_Seq START WITH 1 INCREMENT BY 1;


/*********************************
    W_JOB_CHANGE_DATA
**********************************/  
       
  CREATE TABLE W_JOB_CHANGE_DATA 
   (	CHANGE_ID 		NUMBER(10,0) 	NOT NULL ENABLE, 
	CONTRACT_DATE 		CHAR(10), 
	SALES_AGENT_ID 		NUMBER(10,0), 
	SALES_CLASS_ID 		NUMBER(10,0), 
	LOCATION_ID 		NUMBER(10,0), 
	CUST_ID_ORDERED_BY 	NUMBER(10,0), 
	DATE_PROMISED 		CHAR(10), 
	DATE_SHIP_BY 		CHAR(10), 
	NUMBER_OF_SUBJOBS 	NUMBER(4,0), 
	UNIT_PRICE 		NUMBER(5,2), 
	QUANTITY_ORDERED 	NUMBER(8,0), 
	QUOTE_QTY 		NUMBER(8,0), 
	LEAD_ID 		NUMBER(10,0), 
	 CONSTRAINT W_JOB_CHANGE_DATA_PK PRIMARY KEY (CHANGE_ID)
  ) ;


/*********************************
    W_ERROR_LOG
**********************************/ 

CREATE TABLE W_Error_Log 
(	Log_Id		INTEGER			NOT NULL,
	Change_Id	INTEGER,
	Job_Id		INTEGER,
	Note		VARCHAR(200),
CONSTRAINT W_ERROR_LOG_PK PRIMARY KEY (Log_Id),
CONSTRAINT W_ERROR_LOG_CHANGE_ID_FK FOREIGN KEY(Change_Id) 
   REFERENCES W_Job_Change_Data); 