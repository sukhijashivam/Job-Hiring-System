# Job Hiring System

A robust and scalable job hiring management system designed for academic institutions or placement cells to streamline student placements, company interactions, training programs, and feedback collection.

> ✅ Fully compatible with **Oracle Live SQL**

---

## 📚 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Sample Data](#sample-data)
- [Stored Procedures](#stored-procedures)
- [Views](#views)
- [Triggers](#triggers)
- [Contributing](#contributing)
- [License](#license)

---

## 📌 Project Overview

The **Job Hiring System** is a database-driven application that manages the end-to-end process of student placements. It includes company registration, job posting, student applications, interview scheduling, training programs, and feedback collection. It is designed for university placement cells or training institutions.

The project is built using **Oracle SQL** and is fully tested on **Oracle Live SQL**.

---

## ✨ Features

- **User Management:** Admins, students, and companies with multiple contact details.
- **Job Posting & Application:** Companies post jobs; students apply.
- **Interview Scheduling:** Schedule interviews for job applicants.
- **Training Programs:** Enroll students and track performance.
- **Feedback Collection:** Gather feedback from students.
- **Placement Records:** Track job placements with packages and dates.
- **Stored Procedures:** Automate user creation, status updates, job/training fetching.
- **Views:** For open jobs and reports.
- **Triggers:** Prevent duplicates and ensure integrity.
- **Oracle Live Compatibility:** Easily test/run on Oracle Live SQL.

---

## 🗃️ Database Schema

Main tables:

- `Admin`: Placement cell staff
- `Student`: Student details
- `Company`: Company info
- `Job`: Job postings
- `Trainer`: Trainers for programs
- `Placement_Record`: Successful placements
- `Feedback`: Feedback from students
- `Training_Program`: Training session details
- `Training_Enrollment`: Tracks student training enrollments
- `Application`: Job applications
- `Interview_Schedule`: Interview dates and times

Each main entity (Admin, Student, Company, Trainer) supports multiple emails and phone numbers.

---

## 🚀 Getting Started

To get started:

1. Clone the repository
2. Set up the database using Oracle Live SQL or any Oracle environment
3. Run the provided SQL script

---

## 🔧 Installation

Clone the repository:

```bash
git clone https://github.com/your-username/job-hiring-system.git
cd job-hiring-system
```

Set up Oracle Live SQL or Oracle DB and run:

```sql
@Job-Hiring-project.sql
```

This creates tables, stored procedures, views, triggers, and inserts sample data.

---

## 🧪 Usage

- **Add Users:** Use procedures to add admins, students, companies, trainers
- **Post Jobs:** Add job info including salary, deadlines, description
- **Apply for Jobs:** Students apply and get status updates
- **Schedule Interviews:** Assign interview dates and times
- **Manage Training:** Organize programs and enroll students
- **Collect Feedback:** Students submit training feedback
- **Track Placements:** Record placement info

---

## 🧾 Sample Data

Included in SQL file:

- **Admins:** Ravi Sharma, Priya Mehta
- **Students:** Sample Student, Amit Kumar
- **Companies:** TechSoft, FutureTech
- **Trainers:** Dr. Meena Kapoor, Dr. Rakesh Singh, Anita Desai
- **Jobs:** Software Engineer (TechSoft)
- **Training Programs:** Aptitude Training
- **Feedback:** "Excellent training session", "Good technical session"

---

## 🧮 Stored Procedures

- `Add_Admin`: Add new admin with contact info
- `Add_Trainer`: Register a new trainer
- `Add_Feedback`: Insert student feedback
- `Update_Application_Status`: Modify job application status
- `Get_Jobs_With_Companies`: Show jobs with companies
- `Get_Training_Programs`: List all trainings

---

## 👁️ Views

- `vw_open_jobs`: Lists jobs with future application deadlines

---

## 🛡️ Triggers

- `trg_no_duplicate_student_email`: Blocks duplicate student emails

---

## 🤝 Contributing

Contributions are welcome! Fork the repo and open a pull request with your changes.

---

## 📃 License

This project is licensed under the **MIT License**.

---

Start managing your institution's job hiring process efficiently with the **Job Hiring System**! 🎯
