# 📄 DocSage - Quick Reference Card

## 🚀 Start Application
```bash
npm run dev:all
```
- Backend: http://localhost:5000
- Frontend: http://localhost:8080
- Network: http://10.0.0.235:8080

## 📋 Main Pages

| Page | URL | Purpose |
|------|-----|---------|
| Upload | `/upload` | Upload new documents |
| Documents | `/documents` | View all documents |
| Document Viewer | `/documents?doc=ID` | View single document |
| Dashboard | `/` | Overview page |

## 📤 Upload a File

1. Visit: `http://localhost:8080/upload`
2. Click/drag to select file (PDF, DOC, DOCX, TXT)
3. Fill in:
   - **Title** (required)
   - **Description** (optional)
   - **Category** (required: contract, report, invoice, proposal, research, legal, technical, other)
4. Click **Upload**
5. See success message
6. Auto-redirected to documents

## 👁️ View Document

1. Go to `/documents`
2. Click any document
3. See:
   - File info and download link
   - AI-generated summary
   - Key insights
   - Document metadata

## 💾 File Storage

- **Location**: `/public/uploads/[ID]_[filename]`
- **Database**: `/src/entities/documents.json`
- **Served via**: `http://localhost:5000/uploads/[filename]`

## 🔌 API Endpoints

| Method | Endpoint | Purpose |
|--------|----------|---------|
| GET | `/api/documents` | List all documents |
| GET | `/api/documents/:id` | Get single document |
| POST | `/api/documents` | Create document (with file) |
| PUT | `/api/documents/:id` | Update document |
| DELETE | `/api/documents/:id` | Delete document |
| GET | `/api/health` | Health check |

## 🛠️ Common Commands

```bash
# Check if backend is running
curl http://localhost:5000/api/health

# List all documents
curl http://localhost:5000/api/documents | jq

# View database file
cat src/entities/documents.json | jq

# Check uploaded files
ls -la public/uploads/

# Start backend only
npm run dev:server

# Start frontend only
npm run dev

# Build for production
npm run build
```

## 🐛 Debug

**Check browser console** for:
- `🔧 API Base URL: ...` - API connection info
- `📤 Creating document at: ...` - Upload progress
- `✅ Document created: ...` - Success status
- Error messages if upload fails

**Check backend console** for:
- File save errors
- Database write errors
- API errors

## ❓ Troubleshooting

| Problem | Solution |
|---------|----------|
| Backend not connecting | `curl http://localhost:5000/api/health` |
| Upload fails | Check browser & backend console for errors |
| File not showing | Refresh page, check database has file_url |
| Cannot download | Ensure backend running & file exists |
| Port in use | Kill process: `lsof -i :5000` then `kill -9 <PID>` |

## 📊 Database Format

```json
{
  "id": "timestamp",
  "title": "Document Title",
  "description": "Brief description",
  "category": "contract",
  "file_name": "original_name.pdf",
  "file_url": "/uploads/ID_name.pdf",
  "file_size": 123456,
  "page_count": 5,
  "ai_summary": "AI generated summary...",
  "key_insights": ["insight1", "insight2"],
  "tags": ["tag1", "tag2"],
  "status": "ready|processing|archived",
  "created_date": "2025-11-15T..."
}
```

## 🌐 Network Access

From another device on same WiFi:
```
Frontend: http://10.0.0.235:8080
Backend: http://10.0.0.235:5000
```

## 📚 Documentation

- `FILE_UPLOAD_INTEGRATION.md` - File upload details
- `GETTING_STARTED.md` - Quick start guide
- `README_SETUP.md` - Complete overview
- `COMPLETE_SETUP.md` - Technical details
- `DOCUMENTATION_INDEX.md` - All docs index

## ✨ Features

✅ Upload files with metadata
✅ Auto AI summary generation
✅ File storage & serving
✅ Search & filter documents
✅ Download files
✅ Multi-language support
✅ LAN accessible
✅ Real-time database

## 🎯 Quick Flow

```
Upload File → Backend saves → Database stores → View in Viewer → Download
```

---

**Status**: ✅ All Systems Ready  
**Ready to use**: `npm run dev:all`  
**Access**: `http://localhost:8080`
