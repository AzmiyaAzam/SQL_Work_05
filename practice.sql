USE MY_WORK;
SELECT * FROM BILLING;
SELECT CUSTOMER_ID,AMOUNT_DUE FROM BILLING;
SELECT * FROM CUSTOMER;
SELECT FIRST_NAME, LAST_NAME FROM CUSTOMER;
SELECT ADDRESS,DATE_OF_BIRTH FROM CUSTOMER;
SELECT distinct EMAIL FROM CUSTOMER;
SELECT count(EMAIL) FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE LAST_NAME = 'SODO';
SELECT * FROM BILLING WHERE AMOUNT_DUE<=1000;
SELECT * FROM CUSTOMER WHERE CUSTOMER_ID < 5;
select * FROM BILLING WHERE LATE_FEE<= 500;
SELECT * FROM CUSTOMER WHERE LAST_NAME IN ("SODO","FERRERAS","FULLMAN");
select * FROM CUSTOMER WHERE FIRST_NAME IN ("JENNI","MONICA","JODI","CATIE");
SELECT * FROM CUSTOMER WHERE FIRST_NAME= "JENNI" AND LAST_NAME="DANET";
SELECT * FROM CUSTOMER WHERE FIRST_NAME= "JENNI" OR LAST_NAME ="SODO";
SELECT * FROM BILLING WHERE LATE_FEE< 500 order by LATE_FEE DESC;
SELECT * FROM customer WHERE Customer_id=5;
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE "%ER";
SELECT * FROM CUSTOMER WHERE FIRST_NAME NOT LIKE "%ER";
SELECT * FROM CUSTOMER WHERE ADDRESS IN('65 GOLDEN LEAF TRAIL','814 KINSMAN LANE') AND FIRST_NAME LIKE "%RE";
SELECT * FROM CUSTOMER WHERE LAST_NAME NOT LIKE "%O";
SELECT * FROM CUSTOMER WHERE ADDRESS= "5 NORTHRIDGE ROAD" OR ADDRESS= "814 KINSMAN LANE";
SELECT * FROM CUSTOMER WHERE ADDRESS IN ("5 NORTHRIDGE ROAD","814 KINSMAN LANE");
SELECT * FROM BILLING WHERE BILLING_CYCLE<>"23-JUN" AND BILLING_CYCLE<>"23-JAN";
SELECT * FROM BILLING WHERE BILLING_CYCLE NOT IN ("23-JUN","23-JAN");
SELECT * FROM BILLING WHERE LATE_FEE<500 order by LATE_FEE DESC;
SELECT * FROM BILLING WHERE LATE_FEE<500 order by LATE_FEE;
SELECT * FROM BILLING ORDER BY CUSTOMER_ID ASC, AMOUNT_DUE DESC;
SELECT * FROM BILLING WHERE LATE_FEE < 500 ORDER BY LATE_FEE DESC LIMIT 10;
SELECT * FROM customer limit 10;
SELECT * FROM billing ORDER BY AMOUNT_DUE DESC LIMIT 5;
SELECT * FROM BILLING order by DUE_DATE DESC limit 3;
SET SQL_SAFE_UPDATES=0;
create TABLE CUSTOMER_BACKUP AS select * FROM CUSTOMER;
CREATE TABLE BILLING_BACKUP AS select * FROM BILLING;
ALTER TABLE customer ADD primary key(CUSTOMER_ID);
ALTER TABLE customer MODIFY Customer_id INT auto_increment;
ALTER TABLE BILLING ADD primary key(BILL_ID);
ALTER TABLE BILLING MODIFY BILL_id INT auto_increment;
SELECT * FROM CUSTOMER;
UPDATE customer
set subscription_date = str_to_date(subscription_date,'%m/%d/%Y');
ALTER TABLE CUSTOMER MODIFY SUBSCRIPTION_DATE datetime;
SELECT * FROM CUSTOMER;
UPDATE CUSTOMER
SET DATE_OF_BIRTH=str_to_date(DATE_OF_BIRTH,'%m/%d/%Y');
ALTER TABLE CUSTOMER MODIFY DATE_OF_BIRTH DATETIME;
UPDATE customer
SET LAST_INTERACTION_DATE=str_to_date(LAST_INTERACTION_DATE,'%m/%d/%Y');
ALTER TABLE CUSTOMER MODIFY LAST_INTERACTION_DATE datetime;
insert into customer (first_name, last_name,subscription_date ) values ("henry","red","2023-05-01");

SELECT * FROM BILLING;
INSERT INTO BILLING (AMOUNT_DUE,DUE_DATE) VALUES (100,"2023-06-10");

SELECT* FROM customer;
insert INTO CUSTOMER(FIRST_NAME) VALUES("ANONYMOUS");

SELECT * FROM BILLING;
insert INTO BILLING(BILLING_CYCLE) VALUES ("JUNE 2023");

SELECT* FROM customer;
UPDATE CUSTOMER SET FIRST_NAME = "KATHERINE" WHERE first_NAME = "CATHRIN";
update customer set email = "anonymous@gmail.com" where first_name = "anonymous";

SELECT * FROM BILLING;
update billing set late_fee =  late_fee +5 where payment_date > due_date;

SELECT* FROM customer;
update customer set first_name = trim(first_name);
update customer set address = replace(address, "road","rd");
update customer set phone_number='555555555' where customer_id = 10;
update customer set last_interaction_date = "2023-05-05" where subscription_date <"2023-05-01";

delete from customer where First_name="anonymous";
delete from customer where SUBSCRIPTION_DATE is null and LAST_INTERACTION_DATE is null;

select *from billing;
delete from billing where due_date < '2022-01-01';


SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER(FIRST_NAME,LAST_NAME,SUBSCRIPTION_DATE) VALUES ("HENRY","RED","2023-05-01");

SELECT * FROM BILLING;
INSERT INTO BILLING(AMOUNT_DUE,DUE_DATE) VALUES("100","2023-06-10");

SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER(FIRST_NAME) VALUES ("ANONYMOUS2");

SELECT * FROM BILLING;
INSERT INTO BILLING(BILLING_CYCLE) VALUE ("JUN 2023");

SELECT * FROM CUSTOMER;
SET SQL_SAFE_UPDATES=0;
UPDATE customer SET FIRST_NAME= "KATERINE" WHERE FIRST_NAME="CATHERIN";
SELECT * FROM CUSTOMER;
UPDATE CUSTOMER SET EMAIL="ANONYMOUS2@GMAIL.COM" WHERE FIRST_NAME="ANONYMOUS2";

SELECT * FROM BILLING;
UPDATE BILLING SET LATE_FEE= LATE_FEE+5 WHERE PAYMENT_DATE>DUE_DATE;

SELECT * FROM CUSTOMER;
UPDATE CUSTOMER SET FIRST_NAME=trim(FIRST_NAME);

UPDATE CUSTOMER SET ADDRESS= replace(ADDRESS,"ROAD","RD");
UPDATE CUSTOMER SET PHONE_NUMBER="5555" WHERE CUSTOMER_ID=10;

UPDATE CUSTOMER SET LAST_INTERACTION_DATE="2023-05-05" WHERE SUBSCRIPTION_DATE< "2023-01-01";
DELETE FROM CUSTOMER WHERE FIRST_NAME="ANONYMOUS";

DELETE FROM CUSTOMER WHERE SUBSCRIPTION_DATE IS NULL AND LAST_INTERACTION_DATE IS NULL;
DELETE from CUSTOMER WHERE (SUBSCRIPTION_DATE) IS NULL;

SELECT * FROM BILLING;
DELETE FROM BILLING WHERE DUE_DATE<"2022-01-01";

SELECT * FROM CUSTOMER;
SELECT SUBSCRIPTION_DATE AS OLD_DATE,SUBSCRIPTION_DATE+INTERVAL 1 MONTH AS NEW_DATE FROM CUSTOMER;
SET SQL_SAFE_UPDATES=0;
UPDATE CUSTOMER SET SUBSCRIPTION_DATE=SUBSCRIPTION_DATE+INTERVAL 1 MONTH;

SELECT FIRST_NAME,YEAR(SUBSCRIPTION_DATE) AS SUBSCRIPTION_YEAR FROM CUSTOMER;
SELECT * ,concat(FIRST_NAME,":",EMAIL) AS NAME_EMAIL FROM CUSTOMER;

SELECT * FROM CUSTOMER;
SELECT * FROM BILLING;
SELECT * FROM FEEDBACK;
SELECT * FROM SUBSCRIPTIONS;
SELECT * FROM service_packages;
SELECT * FROM service_usage;

SELECT SERVICE_TYPE,round (AVG (MONTHLY_RATE),2) AS MONTHLY_AVG FROM service_packages
GROUP BY SERVICE_TYPE;

SELECT CUSTOMER_ID, round(MAX(DATA_USED),1) AS CUSTOMER_MAX FROM SERVICE_USAGE
group by CUSTOMER_ID
order by MAX(DATA_USED) DESC
LIMIT 1;

SELECT * FROM SERVICE_USAGE;
SELECT sum(MINUTES_USED) AS TOTAL_MINUTES FROM SERVICE_USAGE WHERE SERVICE_TYPE="MOBILE";
SELECT SERVICE_TYPE, sum(MINUTES_USED) AS TOTAL_MINUTES FROM service_usage
group by service_type having service_type="MOBILE";

SELECT * FROM FEEDBACK;
SELECT RATING,count(*) AS RATING_COUNT FROM FEEDBACK
group by RATING
ORDER BY 1;

SELECT * FROM BILLING;
select CUSTOMER_ID, SUM(AMOUNT_DUE) AS TOTAL FROM billing
GROUP BY Customer_id
HAVING sum(AMOUNT_DUE)>100
ORDER BY 2;

select CUSTOMER_ID, SUM(AMOUNT_DUE) AS TOTAL FROM billing
GROUP BY Customer_id
HAVING TOTAL>100
ORDER BY 2;

SELECT * FROM service_usage;
SELECT SERVICE_TYPE, round(SUM(DATA_USED),2) AS TOTAL FROM SERVICE_USAGE
GROUP BY SERVICE_TYPE;

select * FROM feedback;
SELECT CUSTOMER_ID, count(distinct SERVICE_IMPACTED) AS SERVICE_TYPE,sum(RATING) AS TOTAL_RATING FROM feedback
group by CUSTOMER_ID
HAVING TOTAL_RATING>10 AND SERVICE_TYPE >1;

select * from service_usage;
SELECT CUSTOMER_ID, SERVICE_TYPE,sum(DATA_USED) AS TOTAL_DATA,sum(MINUTES_USED) AS TOTAL_MINUTES FROM SERVICE_USAGE
GROUP BY SERVICE_TYPE,CUSTOMER_ID
ORDER BY CUSTOMER_ID;

SELECT CUSTOMER_ID, SERVICE_TYPE,sum(DATA_USED) AS TOTAL_DATA,sum(MINUTES_USED) AS TOTAL_MINUTES FROM SERVICE_USAGE
GROUP BY 2,1
ORDER BY 2,1;
 -- ___________________________________________________________
 SELECT *FROM CUSTOMER;
 SELECT CUSTOMER_ID , subscription_DATE ,
	case
		WHEN subscription_DATE > "2023-01-01" THEN "NEW"
        ELSE "OLD"
	END AS CUSTOMER_STATUS
FROM CUSTOMER;

select customer_ID , subscription_DATE, 
	CASE
		WHEN SUBSCRIPTION_DATE> "2023-01-01" THEN "NEW"
		WHEN SUBSCRIPTION_DATE ="2023-01-01" THEN "PRESENT"
		ELSE "OLD"
	END AS CUSTOMER_STATUS
FROM CUSTOMER;
-- _________________________________________________________________

SET SQL_SAFE_UPDATE=0;
SELECT *FROM BILLING;

SET payment_date = null 
where payment_date = " ";

select customer_id , bill_id, payment_date,
	case
		when payment_date is not null then "PAID"
	else "UNPAID"
END AS BILLING_STATUS
FROM billing;
-- ___________________________________________________

select * from service_usage;
select avg(data_used) from service_usage;
select usage_id, customer_id, data_used,
	case 
		WHEN data_used > (select avg(data_used) from service_usage) then "HIGH"
    else "LOW"
END AS USE_STATUS
FROM SERVICE_USAGE
ORDER BY DATA_USED;
-- _____________________________________________

select* from feedback;
select feedback_id, feedback_text, rating,
	case 
    when rating = 1 and (lower(feedback_text) like '%outage%' or lower(feedback_text) like '%down%') then 'urgent'
		else 'normal'
	end as feedback_status
from feedback
order by feedback_status;






















