--从Employee表中查询年龄大于30，且性别为男性的所有员工的所有信息
SELECT * FROM Employee
WHERE Age>30 AND Sex = '男'

--从Employee表中查询年龄大于30，或性别为男性的所有员工的所有信息
SELECT * FROM Employee
WHERE Age>30 OR Sex = '男'

--确定指定的值是否和子查询或列表中的值相匹配
--从Teacher表中查询院系为计算机或者土木工程或生物工程的所有老师
SELECT * FROM Employee
WHERE Dname IN('计算机'，'土木工程','生物工程')
--从Teacher表中查询院系不为计算机或者土木工程或生物工程的所有老师
SELECT * FROM Employee
WHERE Dname NOT IN('计算机'，'土木工程','生物工程')

--查找SalesPerson表中所有销售人员的ID以获得当前销售额超过250000的雇员，然后从Employee表中选择EmployeeID与Select子查询相匹配的官员姓名
SELECT FirstName,LastName FROM Contact As c 
JOIN Employee As e 
ON e.ContactID = c.ContactID
WHERE EmployeeID IN (SELECT SalesPersionID
FROM SalesPersion WHERE SalesQuota >2500000)

--查询标准接个不超过400的所有自行车
SELECT ProductID,Name,Color,StandardCost FROM Product
WHERE NOT StandardCost > 400

--确定特定字符串是否和指定模式先匹配
--查询以特定字符串开头的数据。查询以415开头电话号码的所有员工信息
SELECT * FROM Contact
WHERE phone LIKE '415%'
--查询包含特定数据的
SELECT * FROM Contact 
WHERE phone LIKE '%415%'
--查找特定字符而且是指定字符长度的数据.员工姓张而且名字是两个字
SELECT * FROM Employee
WHERE Ename LIKE '张_'
--查找特定字符长度的数据.查出姓名为3个字的所有员工信息
SELECT * FROM Employee
WHERE Ename LIKE '___'

--可以搜索包含一个或多个特殊通配符的字符串。使用精确的ESCAPE子句和转义符在t1表的c1列中查找精确字符串10%~15%
SELECT c1 FROM t2
WHERE c1 LIKE '%10-15!% off %' ESCAPE '!'


