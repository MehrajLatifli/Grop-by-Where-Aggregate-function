use master
use Employees




-- Get empid, firstname, lastname, country, region, city of all employees from USA


select 
Employees.dbo.Employees.BusinessEntityID, 
Employees.dbo.Employees.LastName, 
Employees.dbo.Employees.CountryRegionName, 
Employees.dbo.Employees.City
from Employees.dbo.Employees 
where Employees.dbo.Employees.CountryRegionName='United States'

select 
COUNT(*)
from Employees.dbo.Employees 
where Employees.dbo.Employees.CountryRegionName='United States' 
group by Employees.dbo.Employees.CountryRegionName




-- Get the number of employees for each specialty.


select 
COUNT(*) as [Number of employees], 
Employees.dbo.Employees.JobTitle
from Employees.dbo.Employees 
group by Employees.dbo.Employees.JobTitle




-- Count the number of people for each name. 


select 
COUNT(*) as [Number of Name], 
Employees.dbo.Employees.FirstName
from Employees.dbo.Employees 
group by Employees.dbo.Employees.FirstName




-- Get the most common name.


select 
top(5)
COUNT(*) as [Number of Name], 
Employees.dbo.Employees.FirstName
from Employees.dbo.Employees 
group by Employees.dbo.Employees.FirstName 
having COUNT(*) >1 
order by COUNT(*) desc




-- Get the least common name.


select 
top(5)
COUNT(*) as [Number of name], 
Employees.dbo.Employees.FirstName
from Employees.dbo.Employees 
group by Employees.dbo.Employees.FirstName 
having COUNT(*) >1 
order by COUNT(*) asc




-- Get the top 5 cities where the most workers are. 


select 
top(5)
COUNT(*) as [Number of cities],
Employees.dbo.Employees.City
from Employees.dbo.Employees 
group by Employees.dbo.Employees.City 
having COUNT(*) >1 
order by COUNT(*) desc




-- Issue mailing addresses for emailing to all employees who started working on 1/01/2012.

select 
Employees.dbo.Employees.EmailAddress
from Employees.dbo.Employees 
where Employees.dbo.Employees.StartDate>'2012-01-01'
group by Employees.dbo.Employees.EmailAddress 




-- Issue statistics in which year how many employees were employed

select
COUNT(*) as [Number of employees],
Employees.dbo.Employees.StartDate
from Employees.dbo.Employees 
group by Employees.dbo.Employees.StartDate 




-- Issue statistics in which year how many workers in which countries were employed.


select 
COUNT(*) as [Number of employees],
CONVERT (nvarchar,Year(Employees.dbo.Employees.StartDate))+ ' ' +  Employees.dbo.Employees.CountryRegionName as List
from Employees.dbo.Employees 
group by CONVERT (nvarchar,Year(Employees.dbo.Employees.StartDate))+ ' ' +  Employees.dbo.Employees.CountryRegionName



-- Refresh the Employees table by adding data from the History table to the EndDate column.


Update Employees.dbo.Employees
set Employees.dbo.Employees.EndDate ='2014-05-05'
where Employees.dbo.Employees.BusinessEntityID >0 and Employees.dbo.Employees.BusinessEntityID <90

select * from Employees.dbo.Employees

Update Employees.dbo.Employees
set Employees.dbo.Employees.EndDate ='2008-05-05'
where Employees.dbo.Employees.BusinessEntityID >90 and Employees.dbo.Employees.BusinessEntityID <100

select * from Employees.dbo.Employees

Update Employees.dbo.Employees
set Employees.dbo.Employees.EndDate ='2020-05-15'
where Employees.dbo.Employees.BusinessEntityID >100

select * from Employees.dbo.Employees


-- Issue statistics on how many employees in which year they left.

select
COUNT(*) as [Number of employees],
Employees.dbo.Employees.EndDate
from Employees.dbo.Employees 
group by Employees.dbo.Employees.EndDate 




-- Issue the number of employees who have worked less than a year.

SELECT * FROM Employees.dbo.Employees 
where YEAR(Employees.dbo.Employees.EndDate)-YEAR(Employees.dbo.Employees.StartDate) =0 AND MONTH(Employees.dbo.Employees.EndDate)-MONTH(Employees.dbo.Employees.StartDate)<12
