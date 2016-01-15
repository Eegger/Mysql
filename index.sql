--创建索引
CREATE TABLE Name_index ON StudentInfo(sname)

--创建唯一索引
CREATE UNIQUE INDEX ON address_index StudentInfo(sname)

--创建簇索引
CREATE CLUSTERED INDEX enameluster_index ON Employee(ename)

--索引的销毁
DROP INDEX Employee.enameluster_index

--创建视图。三个表通过两个相等条件进行连接，得到查询结果
CREATE VIEW join_view
	AS
	SELECT ename,dname,score
	FROM Employee,Department,RecruitInfo
	WHERE Employee.address=RecruitInfo.address
AND Employee.dno = Department.dno

--销毁视图
DROP VIEW join_view
