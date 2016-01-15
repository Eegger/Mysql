/*
SQL提供了聚合函数功能来支持对大量数据的总结性操作，
这些操作对于生成相关的报表非常有用
*/

--返回组中各值的平均值，空值将会被忽略
--计算字段的平均值 
select Avg(ListPrice) From Product
--计算费重复字段的平均值
select Avg(DISTINCT ListPric) From Product
--简单的数据汇总
--计算各个部门主管所用的平均休假时间小时数以及总的病假小时数。对检索到的所有行，生成一个单独的会总值。结果会以一个类似表格的形式输出，单引号中的内容为表头
select avg(VacationHours) as 'Average vacation hours',SUM(SickLeaveHours)as 'Total sick leave hours' From Employee where Title Like '%主管'
--汇总列出每个地区的销售人员得到的平均奖金数以及每个地区的本年度销售总和
select AreaID,Avg(Bonus) as 'Average Bonus',SUM(SaleYTD) 'YTD sales'
From SalesPerson Group by AreaID

--返回表达式计算出来的校验和值
--使用checksum生成散列索引，通过将计算校验和列添加到索引表中，然后对校验和列生成索引来生成散列索引
alter table Product 
add cs_Pname as Checksum(Name)
create index Pname_index On Product(cs_Pname)

--使用checksum_agg检测数据库中ProductInventory表的Quantiy列中的更改
select checksum_agg(cast(Quantiy As int))
From ProductInventory

--返回表中的项数
select COUNT(DISTINCT Dno) From Employee
select COUNT(*) From Employee
select COUNT_BIG(*) From Employee --返回值是bigint 类型

--返回表达式的最值
select MAX(TAXRate) From sales.salesTaxRate
select MIN(TAXRate) From sales.salesTaxRate

--返回表达式中所有值的标准偏差
select STDEV(Bonus) From SalesPerson
--总体标准偏差
select STDEVP(Bonus) From SalesPerson
--方差
select VAR(Bonus) From SalesPerson
--总体方差
select VARP(Bonus) From SalesPerson

--求和相关
--简单求和
select Color,SUM(ListPrice),SUM(StandardCost) From Product
where Color is not null and ListPrice != 0.00 and Name like 'Mountain%'
Group by Color 
Order by Color
--分类求和统计
select Color,ListPrice,StandardCost From Product 
where Color is not null and ListPrice != 0.00 and name Like 'Mountain%'
Order by Color
COMPUTE SUM(ListPrice),SUM(StandardCost) By Color

--聚合函数
select SalesQuota,SUM(SaleYTD) 'TotalSalesID',
GROUPING(SalesQuota)
AS 'GROUPING'
From SalesPerson
Group by SalesQuota with ROLLUP

