
-- XAMPP PORT PROBLEM 
-- run cmd as administrator

-- netstat -aon | findstr :port // stick the port directll to : 


-- taskkill /F /pid portfromnetstat // portfromnetstat the port resulted by netstat command in the left top side LISTENING


-- REVIEWER 

-- > PARENT CREATION 
 CREATE TABLE tbl_students
    (Stud_ID INT, Stud_Name VARCHAR(64), Program VARCHAR(64), Year_level VARCHAR(64), CONSTRAINT pk_Stud_ID PRIMARY KEY (Stud_ID));

-- > CHILD CREATION 
 CREATE TABLE tbl_schedule
       (Sched_ID INT, Stud_ID INT, Room INT, Subj_ID INT, Instructor_ID INT, CONSTRAINT pk_Sched_ID PRIMARY KEY (Sched_ID),
        CONSTRAINT fk_Stud_ID
        FOREIGN KEY (Stud_ID)
       REFERENCES tbl_students
        (Stud_ID),
       CONSTRAINT fk_Subj_ID
        FOREIGN KEY (Subj_ID)
        REFERENCES tbl_subjects
        (Subj_ID),
        CONSTRAINT fk_Instructor_ID
        FOREIGN KEY (Instructor_ID)
         REFERENCES tbl_instructors
        (Instructor_ID));


-- > SEARCHING

-- # Kung ano yung naiibang column sa lahat sya ang iuna mong ijoin FROM tbl_name followed by ON for verification
-- # Tas kung ano naman ang pinakamaraming column sya ang inext mong ijoin whether RIGHT/LEFT JOIN followed rin by ON for verification


 SELECT tbl_students.Stud_Name, tbl_students.Program, tbl_subjects.Subj_Name, tbl_schedule.Room FROM tbl_subjects JOIN tbl_schedule
     ON tbl_subjects.Subj_ID = tbl_schedule.Subj_ID
     RIGHT JOIN tbl_students ON tbl_students.Stud_ID = tbl_schedule.Stud_ID
    WHERE tbl_students.Program IN ("BSCS");

-- # Pang maramihan na where clause 

 WHERE tbl_students.Program IN ("BSCS","BSIT");

