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
--将Teacher表中教授计算机硬件，计算机软件的教师的相关信息插入到Users表中
INSERT INTO Users(Name,Sex,Age)
SELECT Tname,TSex,Age FROM Teacher
WHERE CNO IN(SELECT Cno FROM Couse WHERE Cname IN('计算机软件基础','计算机硬件基础'))




