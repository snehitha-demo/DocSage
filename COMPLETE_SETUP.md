# 🚀 DocSage - Complete Setup & Configuration Guide

## What Has Been Set Up

### ✅ Backend Infrastructure
- **Express.js Server** running on port 5000
- **JSON Database** at `src/entities/documents.json`
- **RESTful API** for document management (CRUD operations)
- **CORS Enabled** for cross-origin requests
- **LAN Accessible** on 0.0.0.0 (all network interfaces)

### ✅ Frontend Infrastructure  
- **React + TypeScript** with Vite bundler
- **Shadcn/ui Components** for beautiful UI
- **TailwindCSS** for styling
- **React Router** for navigation
- **React Query** for API data fetching
- **LAN Accessible** via `--host 0.0.0.0`

### ✅ Database Schema (JSON)
```json
{
  "id": "timestamp",
  "title": "Document Title",
  "description": "Brief description",
  "category": "contract|report|invoice|proposal|research|legal|technical|other",
  "file_url": "filename.pdf",
  "file_size": 12345,
  "page_count": 5,
  "ai_summary": "Generated summary text...",
  "key_insights": ["insight1", "insight2"],
  "tags": ["tag1", "tag2"],
  "status": "ready|processing|archived",
  "created_date": "ISO 8601 timestamp"
}
```

## Quick Start

### 1️⃣ First Time Setup
```bash
cd /workspaces/DocSage
npm install
```

### 2️⃣ Start Everything
```bash
# Best option - runs both servers:
npm run dev:all

# OR separately:
npm run dev:server     # Terminal 1 - Backend
npm run dev            # Terminal 2 - Frontend
```

### 3️⃣ Access the App

**Local Machine:**
- Frontend: http://localhost:8080
- Backend: http://localhost:5000

**From Another Device on Same Network:**
1. Get your IP: `hostname -I`
2. Use IP in browser:
   - Frontend: http://YOUR_IP:8080
   - Backend: http://YOUR_IP:5000

**Example:**
- Frontend: http://10.0.0.235:8080
- Backend: http://10.0.0.235:5000

## File Locations

```
📁 DocSage/
├── 📄 server.js                    ← Backend Express server
├── 📄 vite.config.ts              ← Configured for LAN (host: ::)
├── 📄 package.json                ← Scripts: dev:all, dev:server, dev
├── 📄 .env                        ← Environment variables
├── 📁 src/
│   ├── 📄 App.tsx                 ← Main React app
│   ├── 📁 pages/
│   │   ├── Upload.tsx             ← File upload page
│   │   ├── Documents.tsx          ← Document library page
│   │   └── Dashboard.tsx          ← Dashboard
│   ├── 📁 components/
│   │   ├── documents/
│   │   │   └── DocumentViewer.tsx ← Document details viewer
│   │   └── ui/                    ← Shadcn UI components
│   ├── 📁 entities/
│   │   └── documents.json         ← 📊 ACTUAL DATABASE FILE
│   └── 📁 api/
│       └── base44Client.ts        ← API client (HTTP requests)
└── 📄 SETUP.md                    ← Detailed setup guide
```

## How Data Flows

### 📤 Upload Document
1. User fills form on `/upload` page
2. Selects file and category
3. Frontend generates static AI summary based on category
4. Sends POST to `http://localhost:5000/api/documents`
5. Backend saves to `documents.json`
6. User redirected to documents list with success message

### 📥 View Documents
1. User navigates to `/documents`
2. Frontend fetches all docs via `http://localhost:5000/api/documents`
3. Displays in grid or list view
4. User can search, filter, and click to view details
5. Clicking opens DocumentViewer with full document info

### 🔄 Update/Delete Documents
- Similar HTTP calls to backend
- Changes immediately reflected in UI
- Data persisted to `documents.json`

## API Endpoints Reference

### Health Check
```
GET /api/health
Response: {"status":"ok","message":"DocSage Backend is running"}
```

### Get All Documents
```
GET /api/documents
Response: [{ id, title, description, ... }]
```

### Get Single Document
```
GET /api/documents/:id
Response: { id, title, description, ... }
```

### Create Document
```
POST /api/documents
Content-Type: application/json

{
  "title": "My Document",
  "description": "Description",
  "category": "contract",
  "ai_summary": "Summary text",
  "key_insights": ["insight1"],
  "tags": ["important"],
  "page_count": 5,
  "file_size": 12345,
  "status": "ready"
}
```

### Update Document
```
PUT /api/documents/:id
Content-Type: application/json

{
  "status": "archived",
  "title": "Updated Title"
}
```

### Delete Document
```
DELETE /api/documents/:id
Response: {"message":"Document deleted"}
```

## Environment Configuration

### `.env` (for localhost)
```env
VITE_API_URL=http://localhost:5000
```

### `.env.local` (for LAN - optional)
```env
VITE_API_URL=http://10.0.0.235:5000
```

The frontend will automatically use `VITE_API_URL` from environment.

## Features Implemented

### Upload Page Features
- ✅ Drag & drop file upload
- ✅ File format support: PDF, DOC, DOCX, TXT
- ✅ Document categorization (8 types)
- ✅ Auto-generated AI summary (static based on category)
- ✅ Extracting key insights
- ✅ Auto-tagging based on category
- ✅ Real-time validation

### Document Library Features
- ✅ Search by title/description
- ✅ Filter by category
- ✅ Grid/List view toggle
- ✅ Sort by date
- ✅ View document details
- ✅ Status indicators (processing, ready, archived)
- ✅ File metadata display (size, pages)

### Document Viewer Features
- ✅ Full document display
- ✅ AI summary view
- ✅ Key insights display
- ✅ Document metadata
- ✅ Category badges
- ✅ File information
- ✅ Multi-language translation support

## Troubleshooting

### Issue: "Backend not found" error in browser console
**Solution:**
- Verify backend is running: `npm run dev:server`
- Check `http://localhost:5000/api/health`
- Ensure correct `VITE_API_URL` in `.env`

### Issue: LAN access returns "Connection refused"
**Solution:**
- Check firewall allows ports 5000 and 8080
- Verify correct IP: `hostname -I`
- Both servers must be running

### Issue: "Cannot find documents.json"
**Solution:**
- Backend creates it automatically
- If missing, delete and restart backend
- Check write permissions on `src/entities/` folder

### Issue: Documents not saving
**Solution:**
- Check `src/entities/documents.json` is writable
- Verify backend has write permissions
- Check console errors in backend terminal

## Next Steps / Enhancements

### Possible Future Features
- [ ] Real file upload (store files on server)
- [ ] Real AI integration (OpenAI/Claude API)
- [ ] User authentication
- [ ] Document sharing
- [ ] Advanced search with ElasticSearch
- [ ] PDF preview rendering
- [ ] Export to PDF/Word
- [ ] Webhook notifications
- [ ] Document versioning
- [ ] Collaborative annotations

### Database Upgrade Path
- Current: JSON file storage
- Option 1: SQLite for better querying
- Option 2: MongoDB for scalability
- Option 3: PostgreSQL for production

## Performance Tips

- Frontend is optimized with React Query caching
- Backend uses efficient JSON parsing
- Vite provides fast HMR (Hot Module Replacement)
- CSS is minified with TailwindCSS
- Images/assets are lazy-loaded

## Security Notes

Current implementation is suitable for **local/LAN development**. For production:
- Add authentication/authorization
- Implement rate limiting
- Add input validation & sanitization
- Use HTTPS
- Add CORS domain whitelist
- Implement proper error handling
- Add audit logging

## Getting Help

1. Check `SETUP.md` for detailed guide
2. Review API endpoints above
3. Check browser console for errors
4. Check terminal output for backend errors
5. Verify file permissions and network connectivity

---

**Status:** ✅ Ready to use! All systems configured and tested.
**Current Network:** http://10.0.0.235:8080 (Frontend) & http://10.0.0.235:5000 (Backend)
