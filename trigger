 create table1
 create table2

delimiter //
create trigger tr_ins77_Borrower
before insert
on table1
for each row
begin
insert into table2 values(new.rollno,new.name,new.nameofbook);
end
//

mysql> insert into table1 values(1,'gg','ggh');
 -> //
Query OK, 1 row affected (0.06 sec)
mysql> select * from table2;
 -> //
+--------+------+------------+
| rollno | name | nameofbook |
+--------+------+------------+
| 1 | gg | ggh |
+--------+------+------------+
1 row in set (0.00 sec)
///////////////////////////////////////////////////
delimiter //
create trigger tr_del_Borrower
before delete
on table1
for each row
begin
delete from table2 where rollno=old.rollno;
end
//
///////////////////output/////////////////////////////


mysql> delete from table1 where rollno=1;
 -> //
Query OK, 1 row affected (0.07 sec)
mysql> select * from table2;
 -> //
+--------+-------+------------+
| rollno | name | nameofbook |
+--------+-------+------------+
| 2 | komal | oop |
+--------+-------+------------+
1 row in set (0.00 sec)
///////////////////////////////////////////////


delimiter //
create trigger tr_up1_Borrower
before update
on table1
for each row
begin
update table2 set rollno=new.rollno where rollno=old.rollno;
end
//

//////////////////output////////////////////
mysql> update table1 set rollno=4 where rollno=2;
 -> //
Query OK, 1 row affected (0.10 sec)
Rows matched: 1 Changed: 1 Warnings: 0
mysql> select * from table2;
 -> //
+--------+-------+------------+
| rollno | name | nameofbook |
+--------+-------+------------+
| 4 | komal | oop |
+--------+-------+------------+
