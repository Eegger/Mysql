--数据变更操作，包括数据插入，更新，删除操作。这些操作可以在任何基本表上进行

--将新行添加到表或者视图中去
--向数据表中添加数据.向数据表中插入一行数据
INSERT INTO Employee values('2008007','张四丰','女','1979-9-9','s1')
--向表中插入空值
INSERT INTO Employeem values('2008007','张四丰','女',NULL,NULL)
--向表中一次插入多行数据
INSERT INTO Employee 
VALUES('2008007','张三','女','1999-3-7','s1')
    ('2008007','张三','女','1999-3-7','s1')
    ('2008007','张三','女','1999-3-7','s1')
    ('2008007','张三','女','1999-3-7','s1')
    ('2008007','张三','女','1999-3-7','s1')
--从其他表中选择数据插入到当前表
--将Teacher表中教授计算机硬件，计算机软件的教师的相关信息插入到Users表中这个语句值得注意，很有意思。
INSERT INTO Users(Name,Sex,Age)
SELECT Tname,TSex,Age FROM Teacher
WHERE CNO IN(SELECT Cno FROM Couse WHERE Cname IN('计算机软件基础','计算机硬件基础'))

--更新表中的信息
--将表中名字为张四丰的学生的编号修改为s3
update Employee set Dno = 's3' WHERE Ename = '张四丰'
--批量更新信息
--更新Employee表，将部门名称为销售分部的员工的部门名称个修改为销售部，并且工资改为原来的百分之一百一
update Employeewage set Dname = '销售部',wage = wage * 1.1 WHERE Dno = '销售分部'
--查询复合条件的信息并且进行更新
--更新Employeewage 表，将工资低于男职工平均工资的男员工的工资调整为原来的110%，这句话，值得学习
update Employeewage set wage = wage * 1.1 
WHERE Sex = '男' And Wage<(SELECT Sum(wage)/Count(Ename) As AveWage FROM Employee WHERE Sex = '男')

--从表或视图中删除行
--删除特定行
delete FROM Employee WHERE Ename = '张四丰'
--删除复合条件的特定行
--将表中工资低于男职工平均工资的男职工删除
delete FROM Employeewage WHERE Sex = '男'
And wage <(SELECT Sum(wage)/Count(Ename) As AveWage FROM Employee WHERE Sex = '男')
--删除表中的所有记录
delete FROM Employeewage



