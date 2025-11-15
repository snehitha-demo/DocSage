# DocSage Setup Guide

## Prerequisites
- Node.js (v16+)
- npm or yarn

## Installation & Setup

### 1. Install Dependencies
```bash
npm install
```

### 2. Start Development Servers

#### Option A: Run Both Servers Together (Recommended)
```bash
npm run dev:all
```

#### Option B: Run Servers Separately
Terminal 1 - Backend Server:
```bash
npm run dev:server
```

Terminal 2 - Frontend Dev Server:
```bash
npm run dev
```

### 3. Access the Application

#### Local Access (Same Machine)
- Frontend: `http://localhost:8080`
- Backend API: `http://localhost:5000`

#### Network/LAN Access (Other Machines)
Run this to get your IP address:
```bash
hostname -I
```

Then use the IP address to access from another machine:
- Frontend: `http://<YOUR_IP>:8080`
- Backend API: `http://<YOUR_IP>:5000`

Example:
- Frontend: `http://10.0.0.235:8080`
- Backend API: `http://10.0.0.235:5000`

### 4. API Endpoints

#### Get All Documents
```
GET http://localhost:5000/api/documents
```

#### Get Single Document
```
GET http://localhost:5000/api/documents/:id
```

#### Create Document
```
POST http://localhost:5000/api/documents
Content-Type: application/json

{
  "title": "Document Title",
  "description": "Document description",
  "category": "contract",
  "ai_summary": "Summary text",
  "key_insights": ["Insight 1", "Insight 2"],
  "tags": ["tag1", "tag2"],
  "page_count": 5,
  "file_size": 12345
}
```

#### Update Document
```
PUT http://localhost:5000/api/documents/:id
Content-Type: application/json

{
  "title": "Updated Title",
  "status": "archived"
}
```

#### Delete Document
```
DELETE http://localhost:5000/api/documents/:id
```

#### Health Check
```
GET http://localhost:5000/api/health
```

## Database

The application uses a local JSON file for database storage:
- Location: `src/entities/documents.json`
- Automatically created on first run
- No external database setup required

## Features

### Upload Page (`/upload`)
1. Click or drag-drop a file to upload
2. Fill in title, description, and category
3. System generates a static AI summary based on category
4. Document saved to database with auto-generated ID

### Documents Page (`/documents`)
1. Browse all uploaded documents
2. Search by title or description
3. Filter by category
4. View in grid or list mode
5. Click document to open in Document Viewer

### Document Viewer (`/documents?doc=:id`)
1. Full document details display
2. AI-generated summary
3. Key insights extraction
4. Document metadata (size, pages, category)
5. Translation support for multi-language viewing

## Environment Variables

Edit `.env` file to configure:
```env
VITE_API_URL=http://localhost:5000
VITE_SUPABASE_PROJECT_ID=...
VITE_SUPABASE_PUBLISHABLE_KEY=...
VITE_SUPABASE_URL=...
```

## File Structure

```
/
├── server.js                 # Backend Express server
├── src/
│   ├── pages/
│   │   ├── Upload.tsx       # Document upload page
│   │   ├── Documents.tsx    # Document library page
│   │   └── Dashboard.tsx    # Dashboard page
│   ├── components/
│   │   └── documents/
│   │       └── DocumentViewer.tsx
│   ├── entities/
│   │   └── documents.json   # Local database file
│   └── api/
│       └── base44Client.ts  # API client
└── ...
```

## Troubleshooting

### Backend not connecting
- Ensure backend server is running on port 5000
- Check if `http://localhost:5000/api/health` returns status
- Verify `.env` has correct `VITE_API_URL`

### LAN access not working
- Ensure both machines are on same network
- Check firewall settings allowing ports 5000 and 8080
- Use `hostname -I` to get correct IP address
- Ensure using `0.0.0.0` or `::` in server configuration

### Database file issues
- Delete `src/entities/documents.json` to reset
- File will be auto-created on next backend start
- Check file permissions in the directory

## Production Build

```bash
npm run build
```

Output will be in the `dist/` directory.
