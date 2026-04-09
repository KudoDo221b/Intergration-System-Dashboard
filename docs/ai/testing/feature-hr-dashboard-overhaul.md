---
phase: testing
title: "HR Dashboard Overhaul — Testing Strategy"
feature: hr-dashboard-overhaul
description: "Test cases and quality assurance plan for the 7-page HR dashboard."
---

# Testing Strategy

## Test Coverage Goals

- **Unit tests**: All new components render without errors
- **Integration tests**: API calls return expected data, CRUD operations work
- **E2E tests**: Navigation between all 7 pages, form submissions, chart rendering
- **Visual tests**: Match case study reference screenshots

## Unit Tests

### Dashboard Components
- [ ] StatCard renders with correct value, label, and icon
- [ ] Dashboard KPI cards display data from API
- [ ] Monthly Performance chart renders with line data
- [ ] Payroll Distribution donut renders with department data
- [ ] Employee Status bar chart renders grouped data

### Employee Components
- [ ] Employee table renders with correct columns
- [ ] Search filter narrows results
- [ ] AddEmployeeModal opens/closes correctly
- [ ] Form validation prevents empty submissions
- [ ] Status badges render correct colors

### Payroll Components
- [ ] Payroll table renders with salary data
- [ ] Month filter changes displayed data
- [ ] Salary Trend chart renders dual lines
- [ ] Net Salary calculated correctly (Base + Bonus - Deductions)

### Attendance Components
- [ ] Attendance table renders employee records
- [ ] Leave Days >5 shows warning icon
- [ ] Stacked bar chart renders 3 data series per employee
- [ ] Month filter changes data

### Reports Components
- [ ] Report type tabs switch active state
- [ ] All 3 charts render (bar, donut, line)
- [ ] Export buttons are present and styled

### Alerts Components
- [ ] Alert table renders with severity badges
- [ ] AlertDetailPanel opens on row click
- [ ] Severity filter narrows results
- [ ] Action buttons (Dismiss, Investigate, etc.) are present

### Profile Components
- [ ] User card displays localStorage user info
- [ ] Change Password modal opens
- [ ] Logout clears localStorage and redirects

## Integration Tests

- [ ] GET `/api/employees` returns employee array
- [ ] POST `/api/employees` creates new employee in both databases
- [ ] PUT `/api/employees/:id` updates employee in both databases
- [ ] DELETE `/api/employees/:id` removes employee from both databases
- [ ] GET `/api/departments` returns department list
- [ ] GET `/api/positions` returns position list
- [ ] Navigation from sidebar correctly routes to each page

## End-to-End Tests

- [ ] **Login flow**: Enter admin credentials → redirect to Dashboard
- [ ] **Dashboard load**: KPI cards show numbers, charts render
- [ ] **Employee CRUD**: Add employee → appears in list → edit details → delete → removed
- [ ] **Page navigation**: Click each sidebar item → correct page loads
- [ ] **Responsive**: Resize browser → layout adapts, no overflow

## Manual Testing

### Visual Checklist
- [ ] Dashboard matches case study Image 1 layout
- [ ] Employee page matches Image 2 (with Add modal)
- [ ] Payroll page matches Image 3
- [ ] Attendance page matches Image 4
- [ ] Reports page matches Image 5
- [ ] Alerts page matches Image 6
- [ ] Profile page matches Image 7
- [ ] All charts use consistent, professional color palette
- [ ] Sidebar active state highlights correctly
- [ ] Header shows "System Integration Project" branding

### Browser Compatibility
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)

## Test Data

### Mock Users
```json
{"username": "Admin", "role": "admin"}    // admin / admin123
{"username": "User", "role": "user"}      // user / user123
```

### Mock Employee Data
- Minimum 10 employees across 4 departments (IT, HR, Finance, Marketing)
- Mix of Active/Inactive/On Leave statuses

### Mock Payroll Data
- 12 months of salary records per employee
- Base salary ~$9,000, Bonus ~$500-$1000, Deductions ~$10-$50

### Mock Attendance Data
- Monthly records per employee
- Work Days: 15-21, Leave Days: 0-6, Absent Days: 0-2
