SQL> --WAQTD names of the employees earning more than 2500
SQL> select enmae
  2  from emp
  3  where sal > 2500;
select enmae
       *
ERROR at line 1:
ORA-00904: "ENMAE": invalid identifier 


SQL> select ename
  2  from emp
  3  where sal > 2500;

ENAME                                                                           
----------                                                                      
JONES                                                                           
BLAKE                                                                           
SCOTT                                                                           
KING                                                                            
FORD                                                                            

SQL> --WAQTD names of the employees earning less than MILLER
SQL> select ename
  2  from emp
  3  where sal < (select sal)
  4  from emp
  5  where;
where sal < (select sal)
                       *
ERROR at line 3:
ORA-00923: FROM keyword not found where expected 


SQL> --WAQTD names of the employees earning less than MILLER
SQL> select ename
  2  from emp
  3  where sal < (select sal from emp where ename = 'MILLER');

ENAME                                                                           
----------                                                                      
SMITH                                                                           
WARD                                                                            
MARTIN                                                                          
ADAMS                                                                           
JAMES                                                                           

SQL> -- WAQTD name and deptno of the employees working in the same
SQL> Dept as SMITH .
SP2-0734: unknown command beginning "Dept as SM..." - rest of line ignored.
SQL> Set lines 100 pages 100
SQL> -- WAQTD name and deptno of the employees working in the same dept as SMITH
SQL> 
SQL> select ename,deptno
  2  from emp
  3  where deptno = (select deptno from emp where enmae = 'SMITH');
where deptno = (select deptno from emp where enmae = 'SMITH')
                                             *
ERROR at line 3:
ORA-00904: "ENMAE": invalid identifier 


SQL> select ename,deptno
  2  from emp
  3  where deptno = (select deptno from emp where ename = 'SMITH');

ENAME          DEPTNO                                                                               
---------- ----------                                                                               
SMITH              20                                                                               
JONES              20                                                                               
SCOTT              20                                                                               
ADAMS              20                                                                               
FORD               20                                                                               

SQL> --WAQTD name and hiredate of the employees if the employee
SQL> --Was hired after JONES
SQL> 
SQL> select ename and hiredate
  2  from emp
  3  where hiredate < (select hiredate from emp where ename = 'JONES');
select ename and hiredate
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select ename ,hiredate
  2  from emp
  3  where hiredate < (select hiredate from emp where ename = 'JONES');

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SMITH      17-DEC-80                                                                                
ALLEN      20-FEB-81                                                                                
WARD       22-FEB-81                                                                                

SQL> -- WAQTD all the details of the employee working in the same
SQL> --Designation as KING .
SQL> 
SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'KING');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               

SQL> -- WAQTD name , sal , deptno of the employees if the employees
SQL> Earn more than 2000 and work in the same dept as JAMES .
SP2-0734: unknown command beginning "Earn more ..." - rest of line ignored.
SQL> -- WAQTD name , sal , deptno of the employees if the employees Earn more than 2000 and work in the same dept as JAMES
SQL> 
SQL> SELECT ENAME,SAL,DEPTNO
  2  FROM EMP
  3  WHERE SAL > 2000 AND DEPTNO = (SELECT DEPTNO)
  4  ;
WHERE SAL > 2000 AND DEPTNO = (SELECT DEPTNO)
                                            *
ERROR at line 3:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT ENAME,SAL,DEPTNO
  2  FROM EMP
  3  WHERE SAL > 2000 AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'KING');

ENAME             SAL     DEPTNO                                                                    
---------- ---------- ----------                                                                    
CLARK            2450         10                                                                    
KING             5000         10                                                                    

SQL> -- WAQTD all the details of the employees working in the Same designation as MILLER and earning more than 1500
SQL> 
SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL > 1500 AND JOB = (SELECT JOB FROM EMP WHERE JOB = 'MILLER');

no rows selected

SQL> --WAQTD details of the employees earning more than SMITH But less than KING
SQL> SELECT *
  2  FROM EMP
  3  WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH') AND SAL <(SELECT SAL FROM EMP WHERE ENAME = 'KING');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

12 rows selected.

SQL> -- WAQTD name , sal and deptno of the employees if the employee Is earning commission in dept 20 and earning salary more than Scott
SQL> 
SQL> SELECT ENMAE,SAL,DEPTNO
  2  FROM EMP
  3  WHERE COMM IS NOT NULL AND DEPTNO = 20 AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT');
SELECT ENMAE,SAL,DEPTNO
       *
ERROR at line 1:
ORA-00904: "ENMAE": invalid identifier 


SQL> SELECT ENAME,SAL,DEPTNO
  2  FROM EMP
  3  WHERE COMM IS NOT NULL AND DEPTNO = 20 AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT');

no rows selected

SQL> -- WAQTD name and hiredate of the employees who's name ends with 'S' and hired after James
SQL> 
SQL> select ename,hiredate
  2  from emp
  3  where hiredate > (select hiredate from emp where ename = 'JAMES')  and (select ename from emp where ename like 'S%');
where hiredate > (select hiredate from emp where ename = 'JAMES')  and (select ename from emp where ename like 'S%')
                                                                                                                   *
ERROR at line 3:
ORA-00936: missing expression 


SQL> select ename,hiredate
  2  from emp
  3  where hiredate > (select hiredate from emp where ename = 'JAMES')  and  ename like 'S%';

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SCOTT      19-APR-87                                                                                

SQL> /*WAQTD names of the employees working in the same dept as*/

ENAME      HIREDATE                                                                                 
---------- ---------                                                                                
SCOTT      19-APR-87                                                                                

SQL> JAMES and earning salary more than ADAMS and working in the
SP2-0734: unknown command beginning "JAMES and ..." - rest of line ignored.
SQL> same job role as MILLER and hired after MARTIN .
SP2-0734: unknown command beginning "same job r..." - rest of line ignored.
SQL> 
SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPT NO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') AND JOB = (SELECT JOB FROM EMP WHERE ENAME = MULLER) AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN');
WHERE DEPT NO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') AND JOB = (SELECT JOB FROM EMP WHERE ENAME = MULLER) AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN')
           *
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPT NO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER') AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN');
WHERE DEPT NO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER') AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN')
           *
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'JAMES') AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ADAMS') AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER') AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN');

no rows selected

SQL> -- WAQTD all the details of the employees working as salesman in the dept 20 and earning commission more than Smith and hired after KING
SQL> 
SQL> select *
  2  from  job = 'salesman' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING');
from  job = 'salesman' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING')
          *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> select *
  2  from  EMP job = 'salesman' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING');
from  EMP job = 'salesman' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING')
              *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> select *
  2  from  EMP WHERE job = 'salesman' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING');

no rows selected

SQL> select *
  2  from  EMP WHERE job = 'SALESMAN' and deptno = 20 and comm > (select comm from emp where ename = 'SMITH') and hiredate > (select hiredate from emp where ename = 'KING');

no rows selected

SQL> -- WAQTD number of employees earning more than SMITH and less THAN MARTIN
SQL> 
SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH') AND SAL < (SELECT SAL FROM EMP WHERE ENAME = 'MARTIN');

  COUNT(*)                                                                                          
----------                                                                                          
         2                                                                                          

SQL> SELECT ENAME,SAL
  2  FROM EMP
  3  WHERE SAL > (SELECT SAL FROM EMP WHERE JOB = 'JONES');

no rows selected

SQL> SELECT  *
  2  FROM EMP
  3  WHERE JOB IN(SELECT JOB FRM EMP WHERE JOB = 'MANAGER');
WHERE JOB IN(SELECT JOB FRM EMP WHERE JOB = 'MANAGER')
                            *
ERROR at line 3:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT  *
  2  FROM EMP
  3  WHERE JOB IN(SELECT JOB FROM EMP WHERE JOB = 'MANAGER');

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               

SQL> SELECT *
  2  FROM EMP
  3  WHERE JOB ='MANAGER' ;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               

SQL> -- CASE 2
SQL> -- WAQTD deptno of the employee whose name is Miller .
SQL> 
SQL> SELECT DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'MILLER');

    DEPTNO                                                                                          
----------                                                                                          
        10                                                                                          
        10                                                                                          
        10                                                                                          

SQL> SELECT DEPTNO
  2  FROM EMP
  3  WHERE ENAME ='MILLER' ;

    DEPTNO                                                                                          
----------                                                                                          
        10                                                                                          

SQL> SELECT DEPTNO
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'MILLER');

    DEPTNO                                                                                          
----------                                                                                          
        10                                                                                          
        10                                                                                          
        10                                                                                          

SQL> -- WAQTD dname of the employee whose name is Miller
SQL> 
SQL> SELECT ENAME
  2  ;

*
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> -- WAQTD dname of the employee whose name is Miller
SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO  IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'MILLER');

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          

SQL> -- WAQTD Location of ADAMS
SQL> 
SQL> SELECT * FROM DEPT;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTN0 = (SELECT DEPTNO FROM EMP WHERE JOB = 'ADAMS');
WHERE DEPTN0 = (SELECT DEPTNO FROM EMP WHERE JOB = 'ADAMS')
      *
ERROR at line 3:
ORA-00904: "DEPTN0": invalid identifier 


SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE JOB = 'ADAMS');

no rows selected

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'ADAMS');

LOC                                                                                                 
-------------                                                                                       
DALLAS                                                                                              

SQL> -- WAQTD names of the employees working in Location L2.
SQL> 
SQL> SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROME EMP WHERE LOC = 'DALLAS');
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROME EMP WHERE LOC = 'DALLAS')
                                                          *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROME DEPT WHERE LOC = 'DALLAS');
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROME DEPT WHERE LOC = 'DALLAS')
                                                          *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
JONES                                                                                               
SCOTT                                                                                               
ADAMS                                                                                               
FORD                                                                                                

SQL> -- WAQTD number of employees working in dept D3 .
SQL> 
SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DNAME FROM DEPT WHERE DNAME = 'SALES');
WHERE DEPTNO IN (SELECT DNAME FROM DEPT WHERE DNAME = 'SALES')
                        *
ERROR at line 3:
ORA-01722: invalid number 


SQL> SELECT COUNT(*)
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

  COUNT(*)                                                                                          
----------                                                                                          
         6                                                                                          

SQL> -- WAQTD ename , sal of all the employee earning more than SCOTT and working in dept 20
SQL> 
SQL> select ename,sal
  2  from emp
  3  where deptno = 20 and sal < (select sal from emp where ename = 'SCOTT');

ENAME             SAL                                                                               
---------- ----------                                                                               
SMITH             800                                                                               
JONES            2975                                                                               
ADAMS            1100                                                                               

SQL> -- WAQTD all the details of the employee working as a Manager in the dept Accounting
SQL> 
SQL> select *
  2  from emp
  3  where job = 'MANAGER' AND DEPTNO = (SELECT DEPTNO FROM DEPTNO WHERE DNAME = 'ACCOUNTING' );
where job = 'MANAGER' AND DEPTNO = (SELECT DEPTNO FROM DEPTNO WHERE DNAME = 'ACCOUNTING' )
                                                       *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> select *
  2  from emp
  3  where job = 'MANAGER' AND DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'ACCOUNTING' );

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               

SQL> 
SQL> 
SQL> -- WAQTD all the details of the employee working in the same deptno as SMITH and earning more than KING hired after MARTIN in the location BOSTON
SQL> 
SQL> SELECT *
  2  FROM EMP
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH') AND SAL < (SELECT SAL FROM EMP WHERE ENAME = 'KING') AND
  4  HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN') AND DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'BOSTON');

no rows selected

SQL> SELECT COUNT(*) AS clerk_count
  2  FROM EMP
  3  WHERE JOB = 'CLERK'
  4    AND DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH')
  5    AND SAL > (SELECT SAL FROM EMP WHERE ENAME = 'KING')
  6    AND HIREDATE > (SELECT HIREDATE FROM EMP WHERE ENAME = 'MARTIN')
  7    AND DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'BOSTON');

CLERK_COUNT                                                                                         
-----------                                                                                         
          0                                                                                         

SQL> -- WAQTD maximum salary given to a person working in DALLAS
SQL> 
SQL> SELECT MAX(SAL)
  2  FROM EMP
  3  WHERE DEPTNO IN(SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

  MAX(SAL)                                                                                          
----------                                                                                          
      3000                                                                                          

SQL> -- WAQTD DNAME OF THE EMPLOYEES WHOS NAME IS
SQL> -- SMITH
SQL> 
SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH');

DNAME                                                                                               
--------------                                                                                      
RESEARCH                                                                                            

SQL> -- WAQTD DNAME AND LOC OF THE EMPLOYEE WHOS ENAME IS KING
SQL> 
SQL> SELECT DNAME,LOC
  2  FROM EMO
  3  ;
FROM EMO
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> -- WAQTD DNAME AND LOC OF THE EMPLOYEE WHOS ENAME IS KING
SQL> 
SQL> SELECT DNAME,LOC
  2  FROM DEPT
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'KING')
  4  ;

DNAME          LOC                                                                                  
-------------- -------------                                                                        
ACCOUNTING     NEW YORK                                                                             

SQL> 
SQL> 
SQL> -- WAQTD LOC OF THE EMP WHOS EMPLOYEE NUMBER IS 7902
SQL> 
SQL> SELECT LOC
  2  FROM LOC
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE MGR = '7902');
FROM LOC
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM EMP;

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

SQL> SELECT LOC
  2  FROM DEPT
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE MGR = '7902');

LOC                                                                                                 
-------------                                                                                       
DALLAS                                                                                              

SQL> -- WAQTD DNAME AND LOC ALONG WITH DEPTNO OF THE EMPLOYEE WHOS NAME ENDS WITH 'R'
SQL> 
SQL> SELECT DNAME,LOC
  2  FROM DEPTNO
  3  WHERE
  4  ;

*
ERROR at line 4:
ORA-00936: missing expression 


SQL> SELECT DNAME,LOC,DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME LIKE 'R%');

no rows selected

SQL> SELECT DNAME, LOC, DEPTNO
  2  FROM DEPT
  3  WHERE DEPTNO IN (
  4    SELECT DEPTNO
  5    FROM EMP
  6    WHERE ENAME LIKE '%R'
  7  );

DNAME          LOC               DEPTNO                                                             
-------------- ------------- ----------                                                             
ACCOUNTING     NEW YORK              10                                                             
SALES          CHICAGO               30                                                             

SQL> -- WAQTD DNAME OF THE EMPLOYEE WHOS DESIGNATION IS PRESIDENT
SQL> 
SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE JOB = (SELECT JOB FROM EMP WHERE JOB = 'PRESIDENT');
WHERE JOB = (SELECT JOB FROM EMP WHERE JOB = 'PRESIDENT')
      *
ERROR at line 3:
ORA-00904: "JOB": invalid identifier 


SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE JOB = 'PRESIDENT');

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          

SQL> SELECT DNAME
  2  FROM DEPT
  3  WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB = 'PRESIDENT');

DNAME                                                                                               
--------------                                                                                      
ACCOUNTING                                                                                          

SQL> SPOOL OFF
