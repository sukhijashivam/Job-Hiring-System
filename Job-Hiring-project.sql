-- =========================
-- JOB HIRING SYSTEM 
-- =========================

-- =========
-- TABLES
-- =========

-- ADMIN
CREATE TABLE Admin (
    Admin_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Role VARCHAR2(50),
    Password VARCHAR2(255) NOT NULL
);

CREATE TABLE Admin_Email (
    Email_ID VARCHAR2(100),
    Admin_ID NUMBER,
    PRIMARY KEY (Email_ID, Admin_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID) ON DELETE CASCADE
);

CREATE TABLE Admin_Phone (
    Phone_No VARCHAR2(15),
    Admin_ID NUMBER,
    PRIMARY KEY (Phone_No, Admin_ID),
    FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID) ON DELETE CASCADE
);

-- STUDENT
CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    CGPA NUMBER(3,2),
    Graduation_Year NUMBER,
    Department VARCHAR2(100),
    Password VARCHAR2(255) NOT NULL
);

CREATE TABLE Student_Email (
    Email_ID VARCHAR2(100),
    Student_ID NUMBER,
    PRIMARY KEY (Email_ID, Student_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

CREATE TABLE Student_Phone (
    Phone_No VARCHAR2(15),
    Student_ID NUMBER,
    PRIMARY KEY (Phone_No, Student_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

-- COMPANY
CREATE TABLE Company (
    Company_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Industry_Type VARCHAR2(100),
    Contact_Person VARCHAR2(100),
    Website VARCHAR2(100),
    Password VARCHAR2(255) NOT NULL
);

CREATE TABLE Company_Email (
    Email_ID VARCHAR2(100),
    Company_ID NUMBER,
    PRIMARY KEY (Email_ID, Company_ID),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

CREATE TABLE Company_Phone (
    Phone_No VARCHAR2(15),
    Company_ID NUMBER,
    PRIMARY KEY (Phone_No, Company_ID),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

CREATE TABLE Company_Location (
    Company_ID NUMBER,
    Location VARCHAR2(100),
    PRIMARY KEY (Company_ID, Location),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

CREATE TABLE Company_Hiring_History (
    Company_ID NUMBER,
    Hiring_Period VARCHAR2(50),
    Job_Roles CLOB,
    PRIMARY KEY (Company_ID, Hiring_Period),
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

-- JOB
CREATE TABLE Job (
    Job_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Job_Title VARCHAR2(100) NOT NULL,
    Job_Description CLOB,
    Salary NUMBER(10,2),
    Company_ID NUMBER,
    Job_Type VARCHAR2(50),
    Vacancies NUMBER,
    Application_Deadline DATE,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

CREATE TABLE Job_Eligibility (
    Job_ID NUMBER,
    Eligibility_Criterion VARCHAR2(100),
    PRIMARY KEY (Job_ID, Eligibility_Criterion),
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID) ON DELETE CASCADE
);

CREATE TABLE Job_Location (
    Job_ID NUMBER,
    Location VARCHAR2(100),
    PRIMARY KEY (Job_ID, Location),
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID) ON DELETE CASCADE
);

-- TRAINER
CREATE TABLE Trainer (
    Trainer_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Expertise VARCHAR2(100),
    Organisation VARCHAR2(100)
);

CREATE TABLE Trainer_Email (
    Email VARCHAR2(100),
    Trainer_ID NUMBER,
    PRIMARY KEY (Email, Trainer_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID) ON DELETE CASCADE
);

CREATE TABLE Trainer_Phone (
    Phone_No VARCHAR2(15),
    Trainer_ID NUMBER,
    PRIMARY KEY (Phone_No, Trainer_ID),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID) ON DELETE CASCADE
);

-- PLACEMENT
CREATE TABLE Placement_Record (
    Placement_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER,
    Job_ID NUMBER,
    Company_ID NUMBER,
    Package NUMBER(10,2),
    Placement_Date DATE,
    Placement_Location VARCHAR2(100),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID) ON DELETE CASCADE,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) ON DELETE CASCADE
);

-- FEEDBACK
CREATE TABLE Feedback (
    Feedback_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER,
    Rating NUMBER,
    Comments CLOB,
    Trainer_ID NUMBER,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID) ON DELETE CASCADE
);

-- TRAINING PROGRAM
CREATE TABLE Training_Program (
    Training_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Training_Name VARCHAR2(100),
    Training_Description CLOB,
    Duration NUMBER,
    Trainer_ID NUMBER,
    Start_Date DATE,
    End_Date DATE,
    Training_Mode VARCHAR2(50),
    Certification_Provided CHAR(1) CHECK (Certification_Provided IN ('Y', 'N')),
    Training_Cost NUMBER(10,2),
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID) ON DELETE CASCADE
);

-- TRAINING ENROLLMENT
CREATE TABLE Training_Enrollment (
    Enrollment_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Training_ID NUMBER,
    Student_ID NUMBER,
    Performance_Grade VARCHAR2(10),
    Completion_Status VARCHAR2(20),
    FOREIGN KEY (Training_ID) REFERENCES Training_Program(Training_ID) ON DELETE CASCADE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE
);

-- APPLICATION
CREATE TABLE Application (
    Application_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Student_ID NUMBER,
    Job_ID NUMBER,
    Application_Date DATE,
    Status VARCHAR2(50),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID) ON DELETE CASCADE,
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID) ON DELETE CASCADE
);

-- INTERVIEW SCHEDULE
CREATE TABLE Interview_Schedule (
    Interview_ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    Application_ID NUMBER,
    Interview_Date DATE,
    Interview_Time TIMESTAMP,
    Interview_Mode VARCHAR2(50),
    Interviewer_Name VARCHAR2(100),
    FOREIGN KEY (Application_ID) REFERENCES Application(Application_ID) ON DELETE CASCADE
);

-- ===========
-- SAMPLE DATA
-- ===========

-- Admin
INSERT INTO Admin VALUES (101, 'Ravi Sharma', 'Placement Head', 'admin123');
INSERT INTO Admin VALUES (102, 'Priya Mehta', 'Coordinator', 'admin456');
INSERT INTO Admin_Email VALUES ('ravi@university.edu', 101);
INSERT INTO Admin_Phone VALUES ('9876543210', 101);

-- Student
INSERT INTO Student VALUES (501, 'Sample Student', 8.0, 2024, 'CSE', 'studentpass');
INSERT INTO Student VALUES (502, 'Amit Kumar', 7.5, 2023, 'ECE', 'amitpass');
INSERT INTO Student_Email VALUES ('sample@student.edu', 501);
INSERT INTO Student_Phone VALUES ('9998887776', 501);

-- Company
INSERT INTO Company VALUES (201, 'TechSoft', 'IT', 'Sonia Verma', 'www.techsoft.com', 'comp123');
INSERT INTO Company_Email VALUES ('contact@techsoft.com', 201);
INSERT INTO Company_Phone VALUES ('8887776665', 201);
INSERT INTO Company_Location VALUES (201, 'Bangalore');

-- Trainer
INSERT INTO Trainer VALUES (301, 'Dr. Meena Kapoor', 'Soft Skills', 'Skill India');
INSERT INTO Trainer_Email VALUES ('meena@skillindia.org', 301);
INSERT INTO Trainer_Phone VALUES ('9001122334', 301);

-- Job
INSERT INTO Job (Job_Title, Job_Description, Salary, Company_ID, Job_Type, Vacancies, Application_Deadline)
VALUES ('Software Engineer', 'Develop and maintain software.', 800000, 201, 'Full-Time', 5, DATE '2025-06-30');

-- Feedback
INSERT INTO Feedback VALUES (401, 501, 5, 'Excellent training session.', 301);

-- Training Program
INSERT INTO Training_Program (Training_Name, Training_Description, Duration, Trainer_ID, Start_Date, End_Date, Training_Mode, Certification_Provided, Training_Cost)
VALUES ('Aptitude Training', 'Aptitude and logical reasoning.', 10, 301, DATE '2025-05-10', DATE '2025-05-20', 'Offline', 'Y', 2000);

-- ============
-- PROCEDURES
-- ============

-- Add Admin
CREATE OR REPLACE PROCEDURE Add_Admin (
    p_admin_id IN NUMBER,
    p_name IN VARCHAR2,
    p_role IN VARCHAR2,
    p_password IN VARCHAR2,
    p_email IN VARCHAR2,
    p_phone IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Admin (Admin_ID, Name, Role, Password)
    VALUES (p_admin_id, p_name, p_role, p_password);

    INSERT INTO Admin_Email (Email_ID, Admin_ID)
    VALUES (p_email, p_admin_id);

    INSERT INTO Admin_Phone (Phone_No, Admin_ID)
    VALUES (p_phone, p_admin_id);
END;
/

-- Add Trainer
CREATE OR REPLACE PROCEDURE Add_Trainer (
    p_trainer_id IN NUMBER,
    p_name IN VARCHAR2,
    p_expertise IN VARCHAR2,
    p_organisation IN VARCHAR2,
    p_email IN VARCHAR2,
    p_phone IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Trainer (Trainer_ID, Name, Expertise, Organisation)
    VALUES (p_trainer_id, p_name, p_expertise, p_organisation);

    INSERT INTO Trainer_Email (Email, Trainer_ID)
    VALUES (p_email, p_trainer_id);

    INSERT INTO Trainer_Phone (Phone_No, Trainer_ID)
    VALUES (p_phone, p_trainer_id);
END;
/

-- Add Feedback
CREATE OR REPLACE PROCEDURE Add_Feedback (
    p_feedback_id IN NUMBER,
    p_student_id IN NUMBER,
    p_rating IN NUMBER,
    p_comments IN CLOB,
    p_trainer_id IN NUMBER
)
AS
BEGIN
    INSERT INTO Feedback (Feedback_ID, Student_ID, Rating, Comments, Trainer_ID)
    VALUES (p_feedback_id, p_student_id, p_rating, p_comments, p_trainer_id);
END;
/

-- Update Application Status
CREATE OR REPLACE PROCEDURE Update_Application_Status (
    p_application_id IN NUMBER,
    p_new_status IN VARCHAR2
)
AS
BEGIN
    UPDATE Application
    SET Status = p_new_status
    WHERE Application_ID = p_application_id;
END;
/

-- Get Jobs With Companies
CREATE OR REPLACE PROCEDURE Get_Jobs_With_Companies AS
BEGIN
    FOR rec IN (
        SELECT j.Job_ID, j.Job_Title, c.Name AS Company_Name
        FROM Job j
        JOIN Company c ON j.Company_ID = c.Company_ID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Job: ' || rec.Job_Title || ' | Company: ' || rec.Company_Name);
    END LOOP;
END;
/

-- Get Training Programs
CREATE OR REPLACE PROCEDURE Get_Training_Programs AS
BEGIN
    FOR rec IN (
        SELECT Training_Name, Training_Mode, Start_Date, End_Date
        FROM Training_Program
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Program: ' || rec.Training_Name || ', Mode: ' || rec.Training_Mode);
    END LOOP;
END;
/

-- =========
-- VIEWS
-- =========

CREATE OR REPLACE VIEW vw_open_jobs AS
SELECT j.Job_ID, j.Job_Title, c.Name AS Company_Name, j.Application_Deadline
FROM Job j
JOIN Company c ON j.Company_ID = c.Company_ID
WHERE j.Application_Deadline >= SYSDATE;

-- =========
-- TRIGGERS
-- =========

CREATE OR REPLACE TRIGGER trg_no_duplicate_student_email
BEFORE INSERT ON Student_Email
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Student_Email WHERE Email_ID = :NEW.Email_ID;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Duplicate student email not allowed');
    END IF;
END;
/

-- ===================
-- DEMO EXECUTION BLOCKS
-- ===================

BEGIN
    Add_Admin(
        p_admin_id => 103,
        p_name => 'New Admin',
        p_role => 'Placement Head',
        p_password => 'admin789',
        p_email => 'newadmin@university.edu',
        p_phone => '9876543212'
    );
END;
/

BEGIN
    Add_Trainer(
        p_trainer_id => 302,
        p_name => 'Dr. Rakesh Singh',
        p_expertise => 'Technical',
        p_organisation => 'Tech Trainers',
        p_email => 'rakesh@techtrainers.org',
        p_phone => '9002233445'
    );
END;
/

BEGIN
    Add_Feedback(
        p_feedback_id => 402,
        p_student_id => 502,
        p_rating => 4,
        p_comments => 'Good technical session.',
        p_trainer_id => 302
    );
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- JOB LIST ---');
    Get_Jobs_With_Companies;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TRAINING PROGRAMS ---');
    Get_Training_Programs;
END;
/



CREATE OR REPLACE PROCEDURE Add_Admin_With_Contact (
    p_admin_id   IN NUMBER,
    p_name       IN VARCHAR2,
    p_role       IN VARCHAR2,
    p_password   IN VARCHAR2,
    p_email      IN VARCHAR2,
    p_phone      IN VARCHAR2
)
AS
BEGIN
    -- Insert into Admin table
    INSERT INTO Admin (Admin_ID, Name, Role, Password)
    VALUES (p_admin_id, p_name, p_role, p_password);

    -- Insert into Admin_Email table
    INSERT INTO Admin_Email (Email_ID, Admin_ID)
    VALUES (p_email, p_admin_id);

    -- Insert into Admin_Phone table
    INSERT INTO Admin_Phone (Phone_No, Admin_ID)
    VALUES (p_phone, p_admin_id);

    DBMS_OUTPUT.PUT_LINE('Admin and contact details added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Admin ID, email, or phone already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;

BEGIN
    Add_Admin_With_Contact(
        p_admin_id => 104,
        p_name     => 'Suman Gupta',
        p_role     => 'HR Manager',
        p_password => 'sumanpass',
        p_email    => 'suman@university.edu',
        p_phone    => '9123456789'
    );
END;
/

CREATE OR REPLACE PROCEDURE Add_Company_With_Details (
    p_company_id      IN NUMBER,
    p_name            IN VARCHAR2,
    p_industry_type   IN VARCHAR2,
    p_contact_person  IN VARCHAR2,
    p_website         IN VARCHAR2,
    p_password        IN VARCHAR2,
    p_email           IN VARCHAR2,
    p_phone           IN VARCHAR2,
    p_location        IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Company (Company_ID, Name, Industry_Type, Contact_Person, Website, Password)
    VALUES (p_company_id, p_name, p_industry_type, p_contact_person, p_website, p_password);

    INSERT INTO Company_Email (Email_ID, Company_ID)
    VALUES (p_email, p_company_id);

    INSERT INTO Company_Phone (Phone_No, Company_ID)
    VALUES (p_phone, p_company_id);

    INSERT INTO Company_Location (Company_ID, Location)
    VALUES (p_company_id, p_location);

    DBMS_OUTPUT.PUT_LINE('Company and contact details added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Company ID, email, phone, or location already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/




BEGIN
    Add_Company_With_Details(
        p_company_id      => 202,
        p_name            => 'FutureTech',
        p_industry_type   => 'Software',
        p_contact_person  => 'Anil Kumar',
        p_website         => 'www.futuretech.com',
        p_password        => 'future123',
        p_email           => 'info@futuretech.com',
        p_phone           => '9876543211',
        p_location        => 'Hyderabad'
    );
END;
/

BEGIN
    INSERT INTO Training_Enrollment (
        Training_ID,
        Student_ID,
        Performance_Grade,
        Completion_Status
    ) VALUES (
        1,      -- Training_ID
        501,    -- Student_ID
        NULL,   -- Performance_Grade
        'Enrolled'
    );
    DBMS_OUTPUT.PUT_LINE('Student enrolled successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Enrollment failed: ' || SQLERRM);
END;
/

SELECT j.Job_ID, j.Job_Title, c.Name AS Company_Name
FROM Job j
JOIN Company c ON j.Company_ID = c.Company_ID
ORDER BY j.Job_ID;


CREATE OR REPLACE PROCEDURE Add_Trainer_With_Details (
    p_trainer_id   IN NUMBER,
    p_name         IN VARCHAR2,
    p_expertise    IN VARCHAR2,
    p_organisation IN VARCHAR2,
    p_email        IN VARCHAR2,
    p_phone        IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Trainer (Trainer_ID, Name, Expertise, Organisation)
    VALUES (p_trainer_id, p_name, p_expertise, p_organisation);

    INSERT INTO Trainer_Email (Email, Trainer_ID)
    VALUES (p_email, p_trainer_id);

    INSERT INTO Trainer_Phone (Phone_No, Trainer_ID)
    VALUES (p_phone, p_trainer_id);

    DBMS_OUTPUT.PUT_LINE('Trainer and contact details added successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Trainer ID, email, or phone already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;




/




BEGIN
    Add_Trainer_With_Details(
        p_trainer_id   => 303,
        p_name         => 'Anita Desai',
        p_expertise    => 'Aptitude',
        p_organisation => 'SkillUp',
        p_email        => 'anita@skillup.com',
        p_phone        => '9012345678'
    );
END;
/


SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_tp IS
        SELECT Training_ID, Training_Name, Training_Description, Duration, Trainer_ID, Start_Date, End_Date, Training_Mode, Certification_Provided, Training_Cost
        FROM Training_Program;
    rec_tp cur_tp%ROWTYPE;
BEGIN
    OPEN cur_tp;
    LOOP
        FETCH cur_tp INTO rec_tp;
        EXIT WHEN cur_tp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Training_ID: ' || rec_tp.Training_ID);
        DBMS_OUTPUT.PUT_LINE('Training_Name: ' || rec_tp.Training_Name);
        DBMS_OUTPUT.PUT_LINE('Training_Description: ' || rec_tp.Training_Description);
        DBMS_OUTPUT.PUT_LINE('Duration: ' || rec_tp.Duration);
        DBMS_OUTPUT.PUT_LINE('Trainer_ID: ' || rec_tp.Trainer_ID);
        DBMS_OUTPUT.PUT_LINE('Start_Date: ' || TO_CHAR(rec_tp.Start_Date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('End_Date: ' || TO_CHAR(rec_tp.End_Date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Training_Mode: ' || rec_tp.Training_Mode);
        DBMS_OUTPUT.PUT_LINE('Certification_Provided: ' || rec_tp.Certification_Provided);
        DBMS_OUTPUT.PUT_LINE('Training_Cost: ' || rec_tp.Training_Cost);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
    CLOSE cur_tp;
END;
/

SET SERVEROUTPUT ON;

BEGIN
    FOR trainer_record IN (
        SELECT Trainer_ID, Name, Expertise, Organisation FROM Trainer
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Trainer_ID: ' || trainer_record.Trainer_ID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || trainer_record.Name);
        DBMS_OUTPUT.PUT_LINE('Expertise: ' || trainer_record.Expertise);
        DBMS_OUTPUT.PUT_LINE('Organisation: ' || trainer_record.Organisation);
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
    END LOOP;
END;
/





