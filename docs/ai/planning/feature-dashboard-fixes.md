---
phase: planning
title: "Dashboard & Key Modules Enhancements Planning"
description: "Task breakdown and sequencing for implementing dashboard timeline logic, fixing broken UI logic, configuring export handlers, and tying up notifications/navigation."
---

# Project Planning & Task Breakdown

## Milestones
- [x] Milestone 1: Global Settings (Dependencies, Header, Export Component)
- [x] Milestone 2: Feature-Specific UI updates (Month selection logic)
- [x] Milestone 3: API & Action Logic Polish (Add Employee, Alerts)

## Task Breakdown

### Phase 1: Shared Modules & Utilities
- [x] Task 1.1: Install export dependencies (`jspdf`, `jspdf-autotable`, `xlsx`).
- [x] Task 1.2: Build a reusable `ExportModal` component.
- [x] Task 1.3: Update `Header.jsx` to parse notifications from a backend or global context and wire up the dropdown menu with `/profile` navigation and logout handler.

### Phase 2: Page specific Month/Data filtering
- [x] Task 2.1: **Dashboard.jsx** - Implement dynamic Month selection. Hook up `ExportModal`. Apply null checks for charts.
- [x] Task 2.2: **Payroll.jsx** - Fix the "Generate Payroll" logic, add Month Selector, wire up Export.
- [x] Task 2.3: **Attendance.jsx** - Fix "Generate Report" logic, add Month Selector, wire up Export.
- [x] Task 2.4: **Reports.jsx** - Create state logic referencing HR/Payroll/Attendance/Dividend tabs to render independent chart components. Connect Export logic to active state.

### Phase 3: Action Logic Fixes
- [x] Task 3.1: **Employees.jsx** - Debug "Failed to add Employee". Fix the ID formatting (`#` removal). Adjust column width styles.
- [x] Task 3.2: **Alerts.jsx** - Configure functional workflows for "Dismiss", "Inform", and "Investigate" mock actions. Ensure details panel values map properly to state.

## Resource Needs
- `npm i jspdf jspdf-autotable xlsx`
