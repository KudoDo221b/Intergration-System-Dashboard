---
phase: implementation
title: "HR Dashboard Overhaul — Implementation Guide"
feature: hr-dashboard-overhaul
description: "Technical implementation notes, code patterns, and integration details."
---

# Implementation Guide

## Development Setup

### Prerequisites
- Node.js 18+ (for React frontend)
- Python 3.9+ (for Flask backend)
- SQL Server with `HUMAN_2025` database
- MySQL with `PAYROLL` database
- npm packages: `chart.js`, `react-chartjs-2`

### Environment Setup
```bash
# Frontend
cd frontend
npm install chart.js react-chartjs-2
npm start  # localhost:3000

# Backend
cd ..
pip install flask flask-cors pyodbc mysql-connector-python
python app.py  # localhost:5001
```

### Configuration
- Backend runs on port 5001 (`app.py`)
- Frontend proxies API calls to `http://localhost:5001`
- Database connections configured in `config.py`

## Code Structure

```
frontend/src/
├── components/
│   ├── Header.jsx          # Top nav bar
│   ├── Sidebar.jsx         # Left nav sidebar
│   ├── Layout.jsx          # Page layout wrapper
│   ├── StatCard.jsx        # [NEW] Reusable KPI stat card
│   └── AlertDetailPanel.jsx # [NEW] Alert side panel
├── pages/
│   ├── Dashboard.jsx       # [REWRITE] Overview with charts
│   ├── Employees.jsx       # [ENHANCE] With filters + modal
│   ├── EmployeeAdd.jsx     # [KEEP] Add form page
│   ├── EmployeeEdit.jsx    # [KEEP] Edit form page
│   ├── Payroll.jsx         # [NEW] Payroll management
│   ├── Attendance.jsx      # [NEW] Attendance tracking
│   ├── Reports.jsx         # [NEW] Reports & analytics
│   ├── Alerts.jsx          # [NEW] Alerts & notifications
│   ├── Profile.jsx         # [NEW] User profile
│   └── Login.jsx           # [KEEP] Login page
├── services/
│   └── api.js              # API base URL config
├── index.css               # [MODIFY] Extended design system
├── App.js                  # [MODIFY] Updated routes
└── index.js                # Entry point (unchanged)
```

### Files to Delete
- `pages/Games.jsx`
- `pages/UserDashboard.jsx`
- `pages/Departments.jsx`
- `pages/Positions.jsx`
- `pages/Settings.jsx`
- `pages/Analytics.jsx`

## Implementation Notes

### Chart.js Setup Pattern
```jsx
// Import and register
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, BarElement, ArcElement, Title, Tooltip, Legend, Filler } from 'chart.js';
import { Line, Bar, Doughnut } from 'react-chartjs-2';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, BarElement, ArcElement, Title, Tooltip, Legend, Filler);
```

### Mock Data Pattern
For pages where backend APIs don't exist yet, use structured mock data:
```jsx
const MOCK_PAYROLL = [
  { SalaryMonth: 'Oct 2023', BaseSalary: 9000, Bonus: 1000, Deductions: 10, NetSalary: 11200 },
  // ...
];
```

Structure mock data to match expected API response format so swapping to real API is trivial.

### State Management
- Use React `useState` + `useEffect` for all page state
- No global state management needed (each page is self-contained)
- User auth via `localStorage.getItem('user')` parsed as JSON

### Patterns & Best Practices
- **Component composition**: StatCard, ChartCard as reusable wrappers
- **Consistent loading states**: Spinner centered in page area
- **Error handling**: try/catch with toast notifications
- **Pagination**: Client-side with configurable items per page

## Integration Points

### Frontend → Backend API
- All API calls use `fetch()` with `http://localhost:5001/api/...`
- CORS enabled via Flask-CORS on backend
- JSON request/response format

### Backend → Databases
- SQL Server: `pyodbc.connect()` with `ODBC Driver 18 for SQL Server`
- MySQL: `mysql.connector.connect()` with autocommit=False for 2PC
- Distributed transactions: SQL Server commit + MySQL commit (rollback both on error)

## Error Handling

- **API errors**: Display toast notification with error message
- **Network errors**: Show "Connection error" toast
- **Empty data**: Show informative empty state with icon + message
- **Loading states**: Centered spinner during data fetch

## Security Notes

- Login credentials checked client-side against hardcoded values (admin/admin123, user/user123)
- User role stored in localStorage `{username, role}`
- Admin-only routes enforced by conditional rendering in App.js
- No JWT tokens — simple role-based access
