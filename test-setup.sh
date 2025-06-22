#!/bin/bash

# Test script to verify Vibeship setup is complete
# Run this before publishing

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🧪 Testing Vibeship Setup...${NC}"
echo ""

# Check if create-vibeship.sh exists
if [ ! -f "create-vibeship.sh" ]; then
    echo -e "${RED}❌ create-vibeship.sh not found${NC}"
    exit 1
fi

# Test 1: Create a test project
echo -e "${YELLOW}Test 1: Creating test project...${NC}"
rm -rf test-vibeship-project 2>/dev/null || true
bash create-vibeship.sh test-vibeship-project

# Test 2: Verify file structure
echo -e "${YELLOW}Test 2: Checking file structure...${NC}"
cd test-vibeship-project

# Required files
FILES=(
    ".vibe/current.md"
    ".vibe/state.md"
    ".vibe/plan.md"
    ".vibe/log.md"
    ".vibe/ideas.md"
    ".vibe/patterns.md"
    ".cursorrules"
    "QUICK_START.md"
    "README.md"
    "scripts/vibe-metrics.js"
    "scripts/new-ship.js"
    "package.json"
    ".gitignore"
    "src/app/page.tsx"
)

ALL_GOOD=true
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $file"
    else
        echo -e "${RED}✗${NC} $file missing"
        ALL_GOOD=false
    fi
done

if [ "$ALL_GOOD" = false ]; then
    echo -e "${RED}❌ Missing required files${NC}"
    exit 1
fi

# Test 3: Check script executability
echo ""
echo -e "${YELLOW}Test 3: Checking script permissions...${NC}"
if [ -x "scripts/vibe-metrics.js" ] && [ -x "scripts/new-ship.js" ]; then
    echo -e "${GREEN}✓ Scripts are executable${NC}"
else
    echo -e "${RED}✗ Scripts not executable${NC}"
    exit 1
fi

# Test 4: Verify git initialization
echo ""
echo -e "${YELLOW}Test 4: Checking git initialization...${NC}"
if [ -d ".git" ]; then
    echo -e "${GREEN}✓ Git initialized${NC}"
    COMMITS=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    if [ "$COMMITS" -gt 0 ]; then
        echo -e "${GREEN}✓ Initial commit created${NC}"
    else
        echo -e "${RED}✗ No initial commit${NC}"
        exit 1
    fi
else
    echo -e "${RED}✗ Git not initialized${NC}"
    exit 1
fi

# Test 5: Check npm scripts
echo ""
echo -e "${YELLOW}Test 5: Testing npm scripts...${NC}"

# Extract and test vibe commands
npm run vibe:check > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ vibe:check works${NC}"
else
    echo -e "${RED}✗ vibe:check failed${NC}"
    exit 1
fi

npm run vibe:help > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ vibe:help works${NC}"
else
    echo -e "${RED}✗ vibe:help failed${NC}"
    exit 1
fi

# Test 6: Check content quality
echo ""
echo -e "${YELLOW}Test 6: Checking content quality...${NC}"

# Check if placeholders were replaced
if grep -q "PROJECT_NAME_PLACEHOLDER" README.md; then
    echo -e "${RED}✗ Placeholders not replaced in README.md${NC}"
    exit 1
else
    echo -e "${GREEN}✓ README.md placeholders replaced${NC}"
fi

if grep -q "\[Project Name\]" .vibe/state.md; then
    echo -e "${RED}✗ Placeholders not replaced in state.md${NC}"
    exit 1
else
    echo -e "${GREEN}✓ state.md placeholders replaced${NC}"
fi

# Check if scripts have actual content
if grep -q "INSERT.*CONTENT HERE" scripts/vibe-metrics.js; then
    echo -e "${RED}✗ Script placeholders not replaced${NC}"
    exit 1
else
    echo -e "${GREEN}✓ Scripts contain actual code${NC}"
fi

# Test 7: Verify patterns.md has all sections
echo ""
echo -e "${YELLOW}Test 7: Checking patterns.md completeness...${NC}"
if grep -q "Ship Sizes" .vibe/patterns.md && grep -q "Emergency Protocol" .vibe/patterns.md; then
    echo -e "${GREEN}✓ patterns.md includes ship sizes and emergency protocol${NC}"
else
    echo -e "${RED}✗ patterns.md missing required sections${NC}"
    exit 1
fi

# Cleanup
cd ..
rm -rf test-vibeship-project

# Success!
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ ALL TESTS PASSED!${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${BLUE}Your setup is complete and ready for:${NC}"
echo "1. Push to GitHub"
echo "2. Publish to NPM"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "1. Update your GitHub README.md with the new version"
echo "2. Create npm/ directory with NPM package files"
echo "3. Test locally: cd npm && npm link"
echo "4. Publish: cd npm && npm publish"
echo ""
echo -e "${GREEN}🚢 Ready to help developers ship!${NC}"