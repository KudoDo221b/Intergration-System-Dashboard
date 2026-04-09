---
phase: requirements
title: "HR Dashboard Overhaul — Requirements"
feature: hr-dashboard-overhaul
description: "Redesign the System Integration dashboard to match case study specifications with 7 core pages: Overview, Employee, Payroll, Attendance, Reports, Alerts, and Profile."
---

# Requirements & Problem Understanding

## Problem Statement
**What problem are we solving?**

The current dashboard is a basic Data Integration Platform with limited pages (Dashboard, Employees, Departments, Analytics, Games, Settings). It lacks the comprehensive HR management features required by the System Integration case studies (1–5). Specifically:

- **No Payroll Management** — No salary tracking, bonus/deduction calculations, or payroll reports.
- **No Attendance Tracking** — No work-days, leave-days, or absent-days monitoring.
- **No Reports & Analytics** — No exportable reports (PDF/Excel), no salary-by-department charts, no employee distribution analytics.
- **No Alerts & Notifications** — No system for salary anomalies, excessive leave, birthdays, or work anniversaries.
- **No User Profile page** — No profile card with change-password or logout actions.
- **Redundant features** — Games page is out of scope for an HR system and must be removed.

**Who is affected?**
- HR Administrators managing employee data across SQL Server (HUMAN_2025) and MySQL (PAYROLL) databases.
- Department managers reviewing payroll and attendance.

## Goals & Objectives
**What do we want to achieve?**

### Primary Goals
1. Redesign the sidebar to have exactly 7 navigation items: Dashboard, Employees, Payroll, Attendance, Reports, Alerts, Profile.
2. Implement the **Dashboard Overview** page with:
   - KPI cards: Total Employees, Payroll Total (monthly), Attendance Rate
   - Monthly Performance line chart (Revenue vs Expenses)
   - Payroll Distribution by Department (donut chart)
   - Employee Status Overview (grouped bar chart: Present/Leave/Remote)
   - Recent Activities & Employees table with filters (Department, Role, Location) and pagination
3. Enhance the **Employee Management** page with:
   - Search, filter by Department/Position/Status
   - Add Employee modal (Full Name, Email, Phone, Department, Position, Hire Date, Status)
   - Edit, Delete, View actions per row
   - Status badges (Active/Inactive/On Leave)
4. Create the **Payroll Management** page with:
   - Filters: Salary Month range, Select Employee, Select Department
   - Generate Payroll button
   - Payroll Overview table: Salary Month, Base Salary, Bonus, Deductions, Net Salary, View Details action
   - Salary Trend line chart (Net Salary vs Base Salary over time)
5. Create the **Attendance Management** page with:
   - Filters: Select Month, Select Employee
   - Generate Report button
   - Attendance Overview table: Employee Name, Status badge, Work Days, Leave Days, Absent Days, Month
   - Attendance Breakdown stacked bar chart (Work vs Leave vs Absent per employee)
6. Create the **Reports & Analytics** page with:
   - Filters: Date Range, Department, Report Type tabs (HR Report, Payroll Report, Attendance Report, Dividend Report)
   - Export buttons: Export Excel, Export PDF
   - Salary by Department bar chart
   - Employee Distribution donut chart
   - Payroll Trend multi-line chart
7. Create the **Alerts & Notifications** page with:
   - Filters: Alert Type dropdown (Birthday, Work Anniversary, Leave, Salary), Severity dropdown (Info, Warning, Critical)
   - + New Alert button
   - Active Alerts table: Alert Type icon, Employee Name, Message, Severity badge (Critical/Warning/Info), Date, Action
   - Employee Alert Details side panel: Full Employee Info, Related Data Section, action buttons (Dismiss, Investigate, Forward to Manager, Add Note)
8. Create the **User Profile** page with:
   - User Card: avatar, username, role, email
   - Change Password button
   - Logout button

### Secondary Goals
- Use creative, professional chart types — go beyond the reference images with additional charts where appropriate.
- Premium, polished UI with glassmorphism, gradients, micro-animations, and modern typography.
- Responsive layout working on all screen sizes.

### Non-Goals (Out of Scope)
- **Games page** — Remove entirely (Tic Tac Toe, Rock Paper Scissors, Number Guesser).
- **UserDashboard** for regular users — Will be replaced by the Profile page.
- **Real-time WebSocket** updates — Not required for this phase.
- **Backend JWT authentication** — Current localStorage-based auth is sufficient.

## User Stories & Use Cases

### US-1: Dashboard Overview
- As an **HR Admin**, I want to see a high-level overview of employee count, payroll totals, and attendance rates so that I can monitor the organization's health at a glance.
- As an **HR Admin**, I want to see charts showing monthly performance, payroll distribution by department, and employee status overview.

### US-2: Employee Management
- As an **HR Admin**, I want to search and filter employees by name, department, position, and status.
- As an **HR Admin**, I want to add a new employee via a modal form with fields: Full Name, Email, Phone, Department, Position, Hire Date, Status (Active/Inactive).
- As an **HR Admin**, I want to edit, delete, and view employee details inline.

### US-3: Payroll Management
- As an **HR Admin**, I want to view payroll records filtered by month range, employee, and department.
- As an **HR Admin**, I want to see base salary, bonus, deductions, and net salary for each month.
- As an **HR Admin**, I want to see a salary trend chart comparing net vs base salary.

### US-4: Attendance Management
- As an **HR Admin**, I want to view attendance records by month and employee, showing work days, leave days, and absent days.
- As an **HR Admin**, I want to see a stacked bar chart breaking down attendance per employee.
- As an **HR Admin**, I want to generate attendance reports.

### US-5: Reports & Analytics
- As an **HR Admin**, I want to filter reports by date range, department, and report type.
- As an **HR Admin**, I want to export reports as Excel or PDF.
- As an **HR Admin**, I want to see salary-by-department bar charts, employee distribution donut charts, and payroll trend multi-line charts.

### US-6: Alerts & Notifications
- As an **HR Admin**, I want to see active alerts for salary anomalies, excessive leave, birthdays, and work anniversaries.
- As an **HR Admin**, I want to filter alerts by type and severity.
- As an **HR Admin**, I want to click an alert to see employee details and take action (Dismiss, Investigate, Forward, Add Note).

### US-7: User Profile
- As a **User**, I want to view my profile card with username, role, and email.
- As a **User**, I want to change my password and log out from the profile page.

## Success Criteria

1. ✅ All 7 pages render correctly with no console errors.
2. ✅ Dashboard KPI cards display dynamic data from API.
3. ✅ All charts render with realistic mock/API data.
4. ✅ Employee CRUD operations work end-to-end (API ↔ Frontend).
5. ✅ Payroll and Attendance pages display data from MySQL PAYROLL database.
6. ✅ Reports page has export buttons (can be mock for now).
7. ✅ Alerts page displays mock alert data with severity badges and detail panel.
8. ✅ Profile page shows user info from localStorage, change password modal, and logout.
9. ✅ Games page and all game-related routes/components are removed.
10. ✅ Sidebar matches the 7-item navigation as per case study screenshots.
11. ✅ UI is premium and polished — not a basic MVP.

## Constraints & Assumptions

### Technical Constraints
- **Frontend**: React 19 with react-router-dom v7, Bootstrap 5 for utility classes, vanilla CSS for custom styles.
- **Backend**: Flask (Python) with pyodbc (SQL Server) and mysql.connector (MySQL).
- **Databases**: SQL Server `HUMAN_2025` for employee/department/position data; MySQL `PAYROLL` for payroll/attendance/salaries.
- **Charts**: Must use a charting library — Chart.js via react-chartjs-2 is the recommended choice.
- **No Tailwind** — Project uses vanilla CSS with Bootstrap.

### Assumptions
- Payroll data (salaries, attendance) requires new backend API endpoints pulling live from MySQL.
- The user "Olivia Chen / Admin" shown in the case study is a mock user stored in localStorage, but "Change Password" requires a functional backend API to update it (or we integrate a Users table).
- The existing `/employees/add` page will be entirely replaced by the new modal component.
