---
phase: design
title: "Dashboard & UI Enhancements Design"
description: "Architecture and design decisions for addressing multi-page dashboard functional gaps, including date selection, PDF/Excel exports, alert logic, and navigation updates."
---

# System Design & Architecture

## Design Decisions
1. **Export Utilities (PDF/CSV/Excel)**:
   - We will install `jspdf`, `jspdf-autotable`, and `xlsx` to handle exporting cleanly without reinventing parsers.
   - We'll create a reusable `ExportModal.jsx` or an `ExportDropdown` component that can accept the currently viewed dataset or table reference, or fetch logic, and distribute it to the correct format.
2. **Month Selection & Dynamic Data**:
   - Instead of static strings ("Oct 2023"), we'll use a `MonthPicker` component or a standard `<input type="month">` element across Dashboard, Payroll, Attendance, and Reports.
   - The selected month state will trigger `useEffect` hooks to re-fetch or cleanly filter existing data arrays.
   - We will use optional chaining (`?.`) and fallback checks (`|| []`) to prevent the dashboard from crashing when data is null.
3. **Employees Table (# Sign)**:
   - Enhance the string formatting logic. Update Bootstrap grid styles to apply strict column boundaries (`table-layout: fixed` or equivalent utility classes).
4. **Header Navigation**:
   - Convert the hardcoded "3" to a dynamic property based on lengths of alerts array.
   - Utilize a standard Bootstrap Dropdown for the profile avatar. Create UI actions tying to React Router's `useNavigate` for the `/profile` route and `handleLogout` for clearing localStorage.

## Components
### New Components
- **ExportDropdown / ExportModal**: Reusable component managing the different file formats.
- **MonthSelector**: Standardized dropdown or date-picker to select the reporting month.

### Modified Components
- **Dashboard.jsx, Payroll.jsx, Attendance.jsx, Reports.jsx**: Introduce MonthSelector, implement conditional rendering for no-data states, integrate Export tool.
- **Alerts.jsx**: Update the click handler for action buttons (Dismiss, Inform, Investigate) so they dispatch correct API updates or mock state updates and clear the Detail Panel.
- **Header.jsx**: Add state for notifications count. Wrap avatar in a `.dropdown` with a `.dropdown-menu`.
- **AddEmployeeModal.jsx / Employee.jsx**: Find the API bug causing generic errors, ensure required payloads match the DB constraints.

## Non-Functional Requirements
- Ensure responsive tables so explicit boundaries don't overflow smaller screens.
- Keep dependency additions minimal (`xlsx`, `jspdf` preferred).
