-- 1. Write the following queries in SQL, using the university schema:

-- a. Find all courses worth more than 3 credits;
select * from course where credits > 3;

-- b. Find all classrooms situated either in ‘Watson’ or ‘Packard’ buildings;
select * from classroom where (building = 'Watson' or building = 'Packard');

-- c. Find all courses offered by the Computer Science department;
select * from course where dept_name = 'Comp. Sci.';

-- d. Find all courses offered during fall;
select * from course where course.course_id in (select course_id from section where semester = 'Fall');

-- e. Find all students who have more than 45 credits but less than 90;
select * from student where tot_cred > 45 and tot_cred < 90;

-- f. Find all students whose names end with vowels;
select * from student where name like '%a' or name like '%e' or name like '%i' or name like '%o' or name like '%u';

-- g. Find all courses which have course ‘CS-101’ as their prerequisite;
select * from course where course.course_id in (select course_id from prereq where prereq_id = 'CS-101');


-- 2. Write the following queries in SQL, using the university schema:

-- a. For each department, find the average salary of instructors in that
-- department and list them in ascending order. Assume that every
-- department has at least one instructor;
select dept_name, avg(salary) from instructor group by dept_name order by avg(salary);

-- b. Find the building where the biggest number of courses takes place;
create table building_count as
    select building, count(course_id) as cnt from section group by building;
select building from building_count where cnt = (select max(cnt) from building_count);

-- c. Find the department with the lowest number of courses offered;
create table course_count as
    select dept_name, count(course_id) as cnt from course group by dept_name;
select dept_name from course_count where cnt = (select min(cnt) from course_count);

-- d. Find the ID and name of each student who has taken more than 3 courses
-- from the Computer Science department;
create table cs_students as
    select id, name, dept_name from student where dept_name = 'Comp. Sci.';
create table amount_of_taken as
    --select id, name, count(dept_name) as cnt from ((select * from student where dept_name = 'Comp. Sci.') as cs) group by id;
    select id, name, count(dept_name) as cnt from cs_students group by id, name;
select id, name from amount_of_taken where cnt > 0;

-- e. Find all instructors who work either in Biology, Philosophy, or Music
-- departments;
select * from instructor where dept_name in ('Biology', 'Philosophy', 'Music');

-- f. Find all instructors who taught in the 2018 year but not in the 2017 year;
select name from instructor where id in (select id from teaches where year = '2018');


-- 3. Write the following queries in SQL, using the university schema:

-- a. Find all students who have taken Comp. Sci. course and got an excellent
-- grade (i.e., A, or A-) and sort them alphabetically;
create table cs_students1 as
    select * from student where dept_name = 'Comp. Sci.';
select name from cs_students1 where id in (select id from takes where grade like 'A_');

-- b. Find all advisors of students who got grades lower than B on any class;
create table weak_students as
    select * from student where id in (select id from takes where grade not in ('A+', 'A', 'A-', 'B+', 'B', 'B-'));
select i_id from advisor where s_id in (select id from weak_students);

-- c. Find all departments whose students have never gotten an F or C grade;
create table strong_students as
    select * from student where id in (select id from takes where grade in ('A+', 'A', 'A-', 'B+', 'B', 'B-'));
select dept_name from department where dept_name in (select dept_name from strong_students);

-- d. Find all instructors who have never given an A grade in any of the courses
-- they taught;
create table noa_students as
    select * from student where id in (select id from takes where grade not in ('A+', 'A', 'A-'));
select name from instructor where id in (select i_id from advisor where s_id in (select id from noa_students));

-- e. Find all courses offered in the morning hours (i.e., courses ending before
-- 13:00);
select * from time_slot where end_hr <  13; -- Is it really as easy as it seems?

