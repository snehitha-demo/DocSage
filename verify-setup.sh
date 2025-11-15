#!/bin/bash

# DocSage System Verification Script
# Checks if everything is set up correctly

echo ""
echo "╔════════════════════════════════════════╗"
echo "║    DocSage System Verification        ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

CHECKS_PASSED=0
CHECKS_TOTAL=0

# Function to check
check_item() {
  CHECKS_TOTAL=$((CHECKS_TOTAL + 1))
  if [ -f "$1" ] || [ -d "$1" ] || command -v "$1" &> /dev/null || eval "$1" &> /dev/null; then
    echo -e "${GREEN}✓${NC} $2"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
  else
    echo -e "${RED}✗${NC} $2"
  fi
}

echo "📋 Checking System Requirements:"
check_item "node" "Node.js installed"
check_item "npm" "NPM installed"

echo ""
echo "📁 Checking File Structure:"
check_item "/workspaces/DocSage/server.js" "Backend server file"
check_item "/workspaces/DocSage/src/entities/documents.json" "Database file"
check_item "/workspaces/DocSage/src/api/base44Client.ts" "API client"
check_item "/workspaces/DocSage/src/pages/Upload.tsx" "Upload page"
check_item "/workspaces/DocSage/src/pages/Documents.tsx" "Documents page"
check_item "/workspaces/DocSage/src/components/documents/DocumentViewer.tsx" "Document viewer"

echo ""
echo "⚙️  Checking Configuration:"
check_item "/workspaces/DocSage/package.json" "Package.json"
check_item "/workspaces/DocSage/.env" "Environment file"
check_item "/workspaces/DocSage/vite.config.ts" "Vite config"

echo ""
echo "📚 Checking Documentation:"
check_item "/workspaces/DocSage/SETUP.md" "Setup guide"
check_item "/workspaces/DocSage/COMPLETE_SETUP.md" "Complete setup guide"
check_item "/workspaces/DocSage/GETTING_STARTED.md" "Getting started guide"

echo ""
echo "🔧 Checking Dependencies:"
check_item "express" "Express installed"
check_item "cors" "CORS installed"
check_item "react" "React installed"
check_item "vite" "Vite installed"

echo ""
echo "═══════════════════════════════════════════"
echo "📊 Results: $CHECKS_PASSED / $CHECKS_TOTAL checks passed"

if [ $CHECKS_PASSED -eq $CHECKS_TOTAL ]; then
  echo -e "${GREEN}✅ All systems ready!${NC}"
  echo ""
  echo "🚀 Next steps:"
  echo "   npm run dev:all"
  echo ""
  echo "🌐 Access at:"
  echo "   http://localhost:8080"
  exit 0
else
  echo -e "${YELLOW}⚠️  Some checks failed${NC}"
  echo ""
  echo "Try running:"
  echo "   npm install"
  exit 1
fi
