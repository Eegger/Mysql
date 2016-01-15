--从数据库中检索数据行
SELECT Tname From Teacher

--去除查询结果中的重复记录
SELECT DISTINCT Tname From Teacher

--对查询结果进行排序
SELECT Tname,Tno,Sal From Teacher ORDER BY Sal --按照Sal的升序排列
SELECT Tname,Age,Tsext  From Teacher ORDER BY Tsext,Age--先按照Tsext排序，相同时候按照Age排序
SELECT Tname,Sal,Age,Tsext From Teacher ORDER BY 4,3--先按照第4个字段Tsext排序，相同时候按照第3个
SELECT Tname,Sal,Age,Tsext From Teacher ORDER BY Tsext,3 Desc--先按照Tsext升序排列，相同时候，按照第3个降序排列

--定义条件查询
--查出院系为计算机的老师，并将查询结果按照年龄升序排列
SELECT Tname,Dname,Age,Tsext
	From Teacher
	WHERE Dname = '计算机'
	ORDER BY Age
--查询结果将年龄大于等于40岁的老师查出来，同时对结果按照年龄升序排列
SELECT Tname,Dname,Age,Tsext
	From Teacher
	WHERE Age>=40
	ORDER BY Age
--查询结果将所在院系不是计算机的老师查出来，同时对结果按照院系进行升序排序
SELECT Tname,Dname,Age,Tsext
	From Teacher
	WHERE Dname<>'计算机'
	ORDER BY Dname

--在两个值之间进行比较筛选
--查询年龄在30到50之间的，并且按照年龄升序排列
SELECT Tname,Dname,Age,Tsext
	From Teacher
	WHERE Age BETWEEN 30 AND 50
	ORDER BY Age
--查询结果将所在院系介于计算机和生物之间，同时对查询结果按照院系进行升序排列
SELECT Tname,Dname,Age,Tsext
	From Teacher
	WHERE Dname BETWEEN '计算机' AND '生物'
	ORDER BY Dname

