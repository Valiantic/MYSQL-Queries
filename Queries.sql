
-- INSERTIN DATA 
INSERT INTO users (username, email)
VALUES ('jane_doe', 'jane@example.com'),
       ('alice', 'alice@example.com');

-- UPDATE DATA
UPDATE users
SET email = 'new_email@example.com'
WHERE username = 'john_doe';

-- DELETE DATA
DELETE FROM users
WHERE id = 7;

DELETE FROM users
WHERE email IS NULL;

-- UNDO AND REDO
START TRANSACTION;

UPDATE users SET email = 'temp_email@example.com' WHERE id = 1;

-- If everything looks good:
COMMIT;
-- If something went wrong:
-- ROLLBACK;



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

