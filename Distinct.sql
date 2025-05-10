SQL> /* DISTUNCT :
SQL> * It is use to remove repeated or duplicated values from the results table
SQL> Distinct class has to be use as an first argument in the select class
SQL> we can use multiple column as an argumnets in the distinct clause,it wll remove the combination of column i  which the records are duplicate */
SQL> set lines 100 pages 100;
SQL> select * from emp;

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

SQL> select * from dept;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> select distinct ename
  2  from emp;

ENAME                                                                                               
----------                                                                                          
ALLEN                                                                                               
JONES                                                                                               
FORD                                                                                                
CLARK                                                                                               
MILLER                                                                                              
SMITH                                                                                               
WARD                                                                                                
MARTIN                                                                                              
SCOTT                                                                                               
TURNER                                                                                              
ADAMS                                                                                               
BLAKE                                                                                               
KING                                                                                                
JAMES                                                                                               

14 rows selected.

SQL> select distinct deptno
  2  from emp;

    DEPTNO                                                                                          
----------                                                                                          
        30                                                                                          
        20                                                                                          
        10                                                                                          

SQL> -- WAQTD hiredate of all the employees without duplicate value
SQL> select distinct hiredate,ename
  2  from emp;

HIREDATE  ENAME                                                                                     
--------- ----------                                                                                
08-SEP-81 TURNER                                                                                    
02-APR-81 JONES                                                                                     
28-SEP-81 MARTIN                                                                                    
09-JUN-81 CLARK                                                                                     
03-DEC-81 JAMES                                                                                     
20-FEB-81 ALLEN                                                                                     
19-APR-87 SCOTT                                                                                     
17-NOV-81 KING                                                                                      
03-DEC-81 FORD                                                                                      
17-DEC-80 SMITH                                                                                     
23-MAY-87 ADAMS                                                                                     
23-JAN-82 MILLER                                                                                    
22-FEB-81 WARD                                                                                      
01-MAY-81 BLAKE                                                                                     

14 rows selected.

SQL> --WAQTD job and DeptNo of all the employees without repeated values
SQL> select distinct job,deptno
  2  from emp;

JOB           DEPTNO                                                                                
--------- ----------                                                                                
MANAGER           20                                                                                
PRESIDENT         10                                                                                
CLERK             10                                                                                
SALESMAN          30                                                                                
ANALYST           20                                                                                
MANAGER           30                                                                                
MANAGER           10                                                                                
CLERK             30                                                                                
CLERK             20                                                                                

9 rows selected.

SQL> --EXPRESSION
SQL> --WAQTD  name & annual salary of all the employees
SQL> select ename,sal*12 as annual salary
  2  from emp;
select ename,sal*12 as annual salary
                              *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select ename,sal*12 as annual_salary
  2  from emp;

ENAME      ANNUAL_SALARY                                                                            
---------- -------------                                                                            
SMITH               9600                                                                            
ALLEN              19200                                                                            
WARD               15000                                                                            
JONES              35700                                                                            
MARTIN             15000                                                                            
BLAKE              34200                                                                            
CLARK              29400                                                                            
SCOTT              36000                                                                            
KING               60000                                                                            
TURNER             18000                                                                            
ADAMS              13200                                                                            
JAMES              11400                                                                            
FORD               36000                                                                            
MILLER             15600                                                                            

14 rows selected.

SQL> --WAQTD details of all the employees along with their annual salary of the emp;
SQL> select emp.*,annual_salary
  2  from emp;
select emp.*,annual_salary
             *
ERROR at line 1:
ORA-00904: "ANNUAL_SALARY": invalid identifier 


SQL> select emp.*,sal*12
  2  from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO     SAL*12    
---------- ---------- --------- ---------- --------- ---------- ---------- ---------- ----------    
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20       9600    
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30      19200    
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30      15000    
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20      35700    
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30      15000    
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30      34200    
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10      29400    
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20      36000    
      7839 KING       PRESIDENT            17-NOV-81       5000                    10      60000    
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30      18000    
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20      13200    
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30      11400    
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20      36000    
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10      15600    

14 rows selected.

SQL> --WAQTD name and annual salary of emp with hike of 20% in its annual salary
SQL> select ename,sal*12+sal*12*0.2
  2  from emp;

ENAME      SAL*12+SAL*12*0.2                                                                        
---------- -----------------                                                                        
SMITH                  11520                                                                        
ALLEN                  23040                                                                        
WARD                   18000                                                                        
JONES                  42840                                                                        
MARTIN                 18000                                                                        
BLAKE                  41040                                                                        
CLARK                  35280                                                                        
SCOTT                  43200                                                                        
KING                   72000                                                                        
TURNER                 21600                                                                        
ADAMS                  15840                                                                        
JAMES                  13680                                                                        
FORD                   43200                                                                        
MILLER                 18720                                                                        

14 rows selected.

SQL> select ename,sal*12+sal*12*20/100
  2  from emp;

ENAME      SAL*12+SAL*12*20/100                                                                     
---------- --------------------                                                                     
SMITH                     11520                                                                     
ALLEN                     23040                                                                     
WARD                      18000                                                                     
JONES                     42840                                                                     
MARTIN                    18000                                                                     
BLAKE                     41040                                                                     
CLARK                     35280                                                                     
SCOTT                     43200                                                                     
KING                      72000                                                                     
TURNER                    21600                                                                     
ADAMS                     15840                                                                     
JAMES                     13680                                                                     
FORD                      43200                                                                     
MILLER                    18720                                                                     

14 rows selected.

SQL> 	--WAQTD details of all the emp salary along with their mid term salary
SQL> select ename,sal,sal*6
  2  from emp;

ENAME             SAL      SAL*6                                                                    
---------- ---------- ----------                                                                    
SMITH             800       4800                                                                    
ALLEN            1600       9600                                                                    
WARD             1250       7500                                                                    
JONES            2975      17850                                                                    
MARTIN           1250       7500                                                                    
BLAKE            2850      17100                                                                    
CLARK            2450      14700                                                                    
SCOTT            3000      18000                                                                    
KING             5000      30000                                                                    
TURNER           1500       9000                                                                    
ADAMS            1100       6600                                                                    
JAMES             950       5700                                                                    
FORD             3000      18000                                                                    
MILLER           1300       7800                                                                    

14 rows selected.

SQL> spool off
