Select  * from Bank_Loan_Data

/*Total Loan Applications*/

Select count(id) as Total_Loan_Applications  from Bank_Loan_Data

/* MTD Loan Applications */

Select count(id) as MTD_Loan_Applications from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)= 2021

/* Previous Month Sales*/

Select count(id) as PMTD_Loan_Applications from Bank_Loan_Data
where month(issue_date)=11 and year(issue_date)= 2021

/* Total Funded amount*/

Select sum(loan_amount) as Total_Funded_amount  from Bank_Loan_Data

/* MTD Funded Amount*/
Select sum(loan_amount) as MTD_issued_amount  from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)= 2021

/* PMTD Funded Amount*/
Select sum(loan_amount) as PMTD_issued_amount  from Bank_Loan_Data
where month(issue_date)=11 and year(issue_date)= 2021

/* Total Amount received*/
Select sum(total_payment) as Total_Amount_received  from Bank_Loan_Data

/* Total MTD Amount received*/
Select sum(total_payment) as MTD_Total_Amount_received  from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)= 2021

/*MTD Avg Ineterest Rate*/
Select round(avg(int_rate),4)*100 as MTD_avg_interest_rate from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)= 2021

/* PMTD Avg Ineterest Rate*/
Select round(avg(int_rate),4)*100 as MTD_avg_interest_rate from Bank_Loan_Data
where month(issue_date)=11 and year(issue_date)= 2021

/* MTD Avg dti */
Select  round(avg(dti),4) *100 as MTD_Avg_dti from Bank_Loan_Data
where month(issue_date)=12 and year(issue_date)= 2021

/* PMTD Avg dti */
Select  round(avg(dti),4) *100 as MTD_Avg_dti from Bank_Loan_Data
where month(issue_date)=11 and year(issue_date)= 2021

/* Good Loans Percentage */

Select
	(count(CASE when loan_status='Fully Paid' or loan_status='Current' then id end)*100)
	/
	count(id) as Good_loan_percentage
from Bank_Loan_Data

/* Good Loan Applications*/
select count(id) As Good_loans from Bank_Loan_Data
where loan_status in('Fully Paid' ,'Current')

/* Good Loan Funded Amount*/
Select sum(loan_amount) as Good_loan_Funded_Amount from Bank_Loan_Data
where loan_status in('Fully Paid' ,'Current')

/* Good loan Total Received Amount*/
Select sum(total_payment) as Good_loan_Received_Amount from Bank_Loan_Data
where loan_status in('Fully Paid' ,'Current')

/* Bad Loan percentage*/

Select
	(count(CASE when loan_status='charged_off' then id end)*100)/
	count(id) as Bad_loan_percentage
from Bank_Loan_Data

/*Total Applications of Bad Loan*/
select count(id) as total_applications
from Bank_Loan_Data
where loan_status='Charged Off'

/* Loan received from bad loans*/
 select sum(total_payment) as bad_loan_amount_received from bank_loan_data
 where loan_status='Charged Off'

 /* Loan paid to bad loans*/
 select sum(loan_amount) as bad_loan_amount_received from bank_loan_data
 where loan_status='Charged Off'

 /* Loan Status*/
 select  loan_status, 
 count(id) as total_loan_Applications,
 sum(total_payment) as total_amount_received,
 sum(loan_amount) as Total_funded_amount,
 avg(int_rate*100) as Interest_Rate,
 avg(dti*100) as DTI
 from Bank_Loan_Data
 group by loan_status

 /* Loan status for December month*/

  select  loan_status, 
 sum(total_payment) as total_amount_received,
 sum(loan_amount) as Total_funded_amount
 from Bank_Loan_Data
 group by loan_status


























































