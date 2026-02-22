#!/bin/bash

# DocSage Quick Start Script
# This script helps you get everything running on your LAN

echo "╔════════════════════════════════════════════════════╗"
echo "║        DocSage - Document Management System        ║"
echo "║              Quick Start Setup                     ║"
echo "╚════════════════════════════════════════════════════╝"
echo ""

# Get local IP address
LOCAL_IP=$(hostname -I | awk '{print $1}')

echo "🔍 Network Information:"
echo "   Local IP: $LOCAL_IP"
echo "   Frontend Port: 8080"
echo "   Backend API Port: 5000"
echo ""

echo "📋 Installation steps:"
echo "1. npm install"
echo "2. npm run dev:all  (starts both frontend and backend)"
echo ""

echo "🌐 Access URLs:"
echo "   Local Access:"
echo "      Frontend: http://localhost:8080"
echo "      Backend: http://localhost:5000"
echo ""
echo "   LAN Access (from other devices):"
echo "      Frontend: http://$LOCAL_IP:8080"
echo "      Backend: http://$LOCAL_IP:5000"
echo ""

echo "✨ Features:"
echo "   ✓ Upload documents with automatic AI summary"
echo "   ✓ View documents with AI-extracted insights"
echo "   ✓ Search and filter by category"
echo "   ✓ Local JSON database (no setup needed)"
echo "   ✓ Multi-language support"
echo "   ✓ Responsive design with Tailwind CSS"
echo ""

echo "🚀 Ready to go? Run: npm run dev:all"
echo ""
