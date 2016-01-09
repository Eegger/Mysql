--判断左侧操作数的值不大于右侧操作数的真假
--查询结果将年龄不大于50岁的教室查询出来，同时对查询结果按年龄升序排序
SELECT Tname,Sname,Age,Tsex
	FROM Teacher
	WHERE Age!>50
	ORDER BY Age

--判断左侧操作数的值不小于右侧操作数的真假
--查询结果将所在院系不小于计算机的教室查询出来，同时对查询结果按照院系进行升序排列
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Dname !<'计算机'
	ORDER BY Dname

--查询结果将性别不是女的教室查询出来，同时对结果按照年龄进行升序排列
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Tsex !='女'
	ORDER BY Age

--查询结果将姓李的教室查询出来，同时对查询结果按姓名进行排序
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Dname like '李%'
	ORDER BY Dname

--返回两数相除后的余数
--查询结果返回产品ID号，产品单价，除以每种产品的单价后得到的模，转换为整数值
SELECT TOP(100)ProductID,UnitPrice,OrderQty,
CASE((UnitPrice) As int)% OrderQty As Modulo
FROM Sales.SalesOrderDetail;

--对两个整数值执行为与逻辑运算.获得两个数的执行结果
SELECT a_int_value & b_int_value
FROM bitwise

--判断两个表达式的大小
--查询结果将年龄大于55岁的教师的所有信息查出来，并且按照年龄大小升序排列
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Age>55
	ORDER BY Age

--判断连个表达式来得出大于或等于的结果
--查询结果将年龄大于等于60岁的教室查询出来，同时对查询结果按照年龄进行升序排列
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Age>=60
	ORDER BY Age

--两个表达式详解
--计算收入最高的员工和收入最低的员工之间的收入差
SELECT MAX(Wage) - MIN(Wage) As 'WageDifference' FROM Employee

--查询年龄在30岁和50岁之间的教师姓名，部门等信息，将结果按年龄升序排列
SELECT Tname,Dname,Age,Tsex
	FROM Teacher
	WHERE Age BETWEEN 30 AND 50
	ORDER BY Age

--两个表达式相乘。算术乘法运算符
SELECT Ename,Sex,Birthday,Dname,Wage,Wage*0.07 AS Tax
FROM View1
WHERE Dname like '销售部%'
ORDER BY Eno ASC

--算术除法运算
SELECT Sum(Wage)/Count(Ename) AS AveWage
FROM Employeewage
WHERE Dname LIKE '销售部%'
ORDER BY Eno ASC

--匹配方括号所指定的集合中的单个字符
--使用[]运算符查找其他地址中有六位邮编的所有雇员的姓名，住址，邮政编码
SELECT Eno,Ename,address,PostalCode
FROM Employee AS e INNER JION Contact AS c ON e.ContactID = c.ContactID
INNER JION EmployeeAddress AS es ON e.Eno = ea.Eno
INNER JION Address As a ON a.AddressID = ea.AddressID
WHERE a.PostalCode LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'

--匹配不在方括号之间指定的范围或者集合内的单个字符
--在Contact表中查找所有名字以AL开头且第三个字母不是字母a的人
SELECT FirstName,LastName
FROM Person.Contact
WHERE FirstName LIKE 'AL[^a]'
ORDER BY FirstName

--对两个整数值执行位疑惑运算
SELECT a_int_value ^ b_int_value
FROM bitwise
SELECT a_int_value | b_int_value
FROM bitwise
SELECT ~a_int_value,~b_int_value
FROM bitwise

--使用_运算符查找Contact表中的所有人(包含一个以an结尾的三字母名字)
SELECT FirstName,LastName
FROM Person.Contact
WHERE FirstName LIKE '_an'
ORDER BY FirstName

--数值型加法运算
--通过添加休假小时数和病假小时数来计算每个雇员离岗总小时数
SELECT Ename,VacationHours,SickLeaveHours,
VacationHours+SickLeaveHours AS 'Total Hours Away'
FROM Employee AS e
JION Contact AS c ON e.ContactID = c.ContactID
ORDER BY 'Total Hours Away' ASC
--日期加法运算
SET @startdate = '1/10/1900 12:00 AM'
SET @adddays = 5
SET NOCOUNT OFF
SELECT @startdate + 1.25 AS 'start date'
@startdate + @adddays AS 'add date'
--数值与特定参数的加法运算
SET @addvalue = 15
SELECT '124224' + @addvalue
--对参与运算的字符进行转换
SELECT 'The Order is due on' CONVERT(varchar(12),DueDate,101)
FROM SalesOrderHeader
WHERE SaleOrderID = 50001







