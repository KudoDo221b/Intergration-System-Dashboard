---
phase: requirements
title: "Dashboard & Key Modules Enhancements"
feature: dashboard-fixes
description: "Addressing functional and UI issues across Dashboard, Employees, Payroll, Attendance, Reports, Alerts, and Top Navigation."
---

# Requirements & Problem Understanding

## Problem Statement
The recently overhauled HR Dashboard system has several functional gaps, UX issues, and hardcoded placeholders that prevent it from being a fully dynamic, usable interface:
- **Dashboard**: Hardcoded date (Oct 2023), lacking dynamic month selection, and crashes/UI issues on null data. Export Report button lacks PDF/CSV/Excel format options and logic.
- **Employees**: The "Add Employee" flow fails with "Failed to add Employee". UI needs polish (remove `#` from IDs, better tables with column boundaries).
- **Payroll**: "Generate Payroll" button is broken. Missing month selection for data filtering. Export Report format options (PDF, CSV, Excel) missing.
- **Attendance**: Missing month selection for filtering records. Generate Report is broken. Export formats (PDF/CSV/Excel) missing.
- **Reports**: HR, Payroll, Attendance, and Dividend buttons lack visualization logic (need distinct charts for each). Export Excel/PDF buttons are non-functional and need to tie to the selected report and month.
- **Alerts**: Logic for events (Dismiss Alert, Inform Manager, Investigate Further) is broken or incorrect. Values in detail panel are not rendering correctly.
- **Header/Nav**: Notification badge is hardcoded to "3". User Avatar has no dropdown menu configured for "Profile" and "Logout" actions.

## Goals & Objectives
**Primary Goals**
1. **Dynamic Dates**: Implement dynamic time and month selection across Dashboard, Payroll, Attendance, and Reports avoiding null data errors.
2. **Export Functionality**: Introduce a functional export dropdown/modal offering PDF, CSV, and Excel formats wherever "Export" or "Generate Report" is used.
3. **Employees Fix**: Debug and resolve the "Failed to add Employee" error. Enhance the Employees table UI.
4. **Reports Logic**: Ensure the four distinct report sections actually display unique charts based on fetched backend data.
5. **Alerts Continuity**: Correct the action logic (Dismiss, Inform, Investigate) and accurately display details.
6. **Header Dynamics**: Make the notification counter dynamic based on actual user alerts. Implement the Avatar dropdown with functional Profile viewing and Logout routes.

**Non-Goals**
- Complex real-time WebSocket implementations for notifications (polling or context on load is fine for now).
- Expanding the database schema heavily unless absolutely required to support the fixes.

## User Stories
- As an HR Admin, I want to select different months on the Dashboard, Payroll, and Attendance pages so I can view accurate historical data.
- As an HR Admin, I want to export my current view (Dashboard/Payroll/Attendance/Reports) as PDF, CSV, or Excel easily.
- As an HR Admin, I want to successfully add new employees without encountering system errors.
- As an HR Admin, I want to view distinct, functional charts for HR, Payroll, Attendance, and Dividends when I click their respective buttons.
- As a User, I want to see my actual unread notification count in the top navigation.
- As a User, I want to click my avatar to access my Profile or Logout of the system securely.

## Success Criteria
- [ ] No hardcoded dates (e.g., "Oct 2023") on the dashboard; month selection functions correctly.
- [ ] Clicking "Export Report" or "Generate Payroll/Report" prompts for PDF/CSV/Excel, and the file generated is accurate.
- [ ] "Add Employee" API call succeeds and UI reflects the new employee. '#' removed from IDs and table UI improved.
- [ ] Reports page shows real visualization specific to the selected report type and month.
- [ ] Alerts action buttons successfully update state or trigger appropriate workflows.
- [ ] Top navigation shows real notification count, and avatar dropdown provides working Profile/Logout links.
