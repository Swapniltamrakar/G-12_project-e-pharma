delimiter $$
create procedure emp_det(in pdeptno int)
begin
declare max,min,avg,count double(9,2);
select Max(sal),Min(sal),avg(sal),count(*) into max,min,avg,count
from emp
where deptno=pdeptno;
select max,min,avg,count;
end $$
delimiter ;


 delimiter $$
create procedure emp_det(in pdeptno int,out max double(9,2),out min double(9,2),out avg double(9,2),out count int)
begin
select Max(sal),Min(sal),avg(sal),count(*) into max,min,avg,count
from emp
where deptno=pdeptno;
end $$
