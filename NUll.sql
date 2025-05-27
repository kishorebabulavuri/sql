SQL> select * from emp where comm is null;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

10 rows selected.

SQL> select *
  2  from emp
  3  where mgr is null;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               

SQL> select * from dept;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> select *
  2  from emp
  3  where deptno is 30;
where deptno is 30
                *
ERROR at line 3:
ORA-00908: missing NULL keyword 


SQL> select *
  2  from emp
  3  where deptno = 30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               

6 rows selected.

SQL> select *
  2  from emp
  3  where job is salesman and deptno is 30;
where job is salesman and deptno is 30
             *
ERROR at line 3:
ORA-00908: missing NULL keyword 


SQL> select *
  2  from emp
  3  where job is 'SALESMAN' and deptno is '30';
where job is 'SALESMAN' and deptno is '30'
             *
ERROR at line 3:
ORA-00908: missing NULL keyword 


SQL> select *
  2  from emp
  3  where job is 'SALESMAN' and deptno is '30';
where job is 'SALESMAN' and deptno is '30'
             *
ERROR at line 3:
ORA-00908: missing NULL keyword 


SQL> select *
  2  from emp
  3  where job = 'SALESMAN' and deptno = 30;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               

SQL> --4
SQL> select *
  2  from emp
  3  where job = 'SALESMAN' and deptno = 30 and sal>1500;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               

SQL> --5
SQL> select ename
  2  from emp
  3  where ename like '%s%a%';

no rows selected

SQL> select ename
  2  from emp
  3  where ename like '%S%A%';

no rows selected

SQL> select ename
  2  from emp
  3  where ename like '%S%A';

no rows selected

SQL> from emp
SP2-0042: unknown command "from emp" - rest of line ignored.
SQL> select ename
  2  from emp
  3  where ename like '%S';

ENAME                                                                                               
----------                                                                                          
JONES                                                                                               
ADAMS                                                                                               
JAMES                                                                                               

SQL> --6
SQL> selct *
SP2-0042: unknown command "selct *" - rest of line ignored.
SQL> select *
  2  from emp
  3  where deptno between 11 and deptno between 19;
where deptno between 11 and deptno between 19
                                   *
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> select *
  2  from emp
  3  where deptno between 11 and 19;

no rows selected

SQL> select *
  2  from emp
  3  where deptno not in (10,20);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               

6 rows selected.

SQL> --list all the employees except those who are working in dept 10 & 20
SQL> select *
  2  from emp
  3  where deptno not in (10,20);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               

6 rows selected.

SQL> --Name does not start with s
SQL> select ename
  2  from emp
  3  where ename not like '%s';

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                
JONES                                                                                               
MARTIN                                                                                              
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
ADAMS                                                                                               
JAMES                                                                                               
FORD                                                                                                
MILLER                                                                                              

14 rows selected.

SQL> select ename
  2  from emp
  3  where ename not like '%s';

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                
JONES                                                                                               
MARTIN                                                                                              
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
ADAMS                                                                                               
JAMES                                                                                               
FORD                                                                                                
MILLER                                                                                              

14 rows selected.

SQL> select ename
  2  from emp
  3  where ename not like 's%';

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                
JONES                                                                                               
MARTIN                                                                                              
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
ADAMS                                                                                               
JAMES                                                                                               
FORD                                                                                                
MILLER                                                                                              

14 rows selected.

SQL> select
  2  *
  3  from emp
  4  where deptno=10 and job = 'REPORTING MANAGERS';

no rows selected

SQL> select *
  2  FROM EMP
  3  ;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

14 rows selected.

SQL> select *
  2  from emp
  3  where deptno=10 and job in('MANAGER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               

SQL> --9
SQL> select *
  2  from emp
  3  where comm is null and job = 'CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

SQL> --10
SQL> select * from emp
  2  where job not in ('MANAGER') and deptno in(10,20);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

6 rows selected.

SQL> --11
SQL> select * from emp
  2  where sal > 2450 and deptno in(30);

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               

SQL> --12
SQL> select * from emp
  2  where job in ;
where job in 
            *
ERROR at line 2:
ORA-00936: missing expression 


SQL> spool off
