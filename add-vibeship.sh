#!/bin/bash

# Add Vibeship to Existing Project
# Run from your project root

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}"
echo "┌─────────────────────────────────────────┐"
echo "│     🚢 ADDING VIBESHIP FRAMEWORK 🚢     │"
echo "└─────────────────────────────────────────┘"
echo -e "${NC}"

# Check if we're in a git repo
if [ ! -d .git ]; then
    echo -e "${RED}❌ No git repository found.${NC}"
    echo "Initialize git first: git init"
    exit 1
fi

# Check if .vibe already exists
if [ -d .vibe ]; then
    echo -e "${YELLOW}⚠️  .vibe folder already exists.${NC}"
    read -p "Overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
    rm -rf .vibe
fi

echo -e "${BLUE}📁 Creating .vibe folder...${NC}"
mkdir -p .vibe
mkdir -p scripts

# Detect project type
PROJECT_TYPE="unknown"
if [ -f "package.json" ]; then
    if grep -q "next" package.json 2>/dev/null; then
        PROJECT_TYPE="nextjs"
    elif grep -q "react" package.json 2>/dev/null; then
        PROJECT_TYPE="react"
    elif grep -q "vue" package.json 2>/dev/null; then
        PROJECT_TYPE="vue"
    else
        PROJECT_TYPE="node"
    fi
elif [ -f "Cargo.toml" ]; then
    PROJECT_TYPE="rust"
elif [ -f "go.mod" ]; then
    PROJECT_TYPE="go"
elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    PROJECT_TYPE="python"
fi

echo -e "${GREEN}🔍 Detected project type: $PROJECT_TYPE${NC}"

# Get project name
PROJECT_NAME=$(basename "$PWD")

# Create state.md
cat > .vibe/state.md << EOF
# Project State: $PROJECT_NAME

> The single source of truth for architecture, decisions, and progress.

## 🎯 Project Overview

**Purpose**: [One sentence - what problem does this solve?]

**Current Status**: Adopting Vibeship Framework

**Tech Stack**: [Detected: $PROJECT_TYPE]
- [Fill in your stack details]

## 🏗️ Current Architecture

[Describe your existing architecture]

## 📦 Existing Dependencies

[Run 'npm list --depth=0' and document key packages]

## 🚢 Migration to Vibeship

### Pre-Vibeship State
- Last commit: $(git log -1 --format=%cd --date=short 2>/dev/null || echo "No commits yet")
- Files: $(find . -type f -name "*.js" -o -name "*.ts" -o -name "*.jsx" -o -name "*.tsx" 2>/dev/null | wc -l || echo "unknown")
- TODOs: $(grep -r "TODO" --include="*.js" --include="*.ts" --include="*.jsx" --include="*.tsx" . 2>/dev/null | wc -l || echo "unknown")

### First Ships Planned
1. [First small improvement]
2. [Second small improvement]

---

*Vibeship adopted: $(date +%Y-%m-%d)*
EOF

# Create current.md for first ship
cat > .vibe/current.md << 'EOF'
# Current Ship: #1 - Adopt Vibeship Framework

## 🚢 Ship Target: Today by 5 PM

### 🎯 Goal
Successfully integrate Vibeship into existing project and identify first real feature to ship

### ✅ Definition of Done
- [x] .vibe folder created
- [ ] Current architecture documented in state.md
- [ ] First real feature identified for Ship #2
- [ ] Team onboarded (if applicable)
- [ ] All existing tests pass

### 📋 Acceptance Criteria
- [ ] Can run 'npm run vibe' successfully
- [ ] Next 3 ships identified in ideas.md
- [ ] Existing functionality unaffected
- [ ] Patterns documented in patterns.md

### 🚫 NOT This Ship (Stay Focused!)
- Refactoring existing code (later)
- Adding new features (Ship #2)
- Changing tech stack (later)

## 📊 Progress Tracking

**Status**: 🚧 In Progress

**Time Tracking**:
- Estimated: 2 hours
- Actual so far: 0 hours

---

*Ship started: $(date)*
EOF

# Create plan.md
cat > .vibe/plan.md << 'EOF'
# Ship Plan: #1 - Adopt Vibeship Framework

> Complete this BEFORE writing any code.

## 🎯 What We're Building

**User Story**: As a developer, I want to adopt the Vibeship framework so that I can ship features daily instead of abandoning this project

**Technical Approach**: Add Vibeship structure to existing project without breaking anything

## 🔍 Integration Analysis

### New Dependencies
- [ ] None (Vibeship is just files and scripts)

### Database Changes
- [ ] None (just adding documentation)

### API Changes
- [ ] None (framework addition only)

## ⚠️ Impact Assessment

### What Could Break
1. **Nothing** - We're only adding files, not changing existing code

### Files to Create
```
.vibe/
├── state.md      # Architecture documentation
├── current.md    # This ship's details
├── plan.md       # This file
├── log.md        # Ship history
├── ideas.md      # Future features
└── patterns.md   # Coding standards

scripts/
├── vibe-metrics.js  # Progress tracking
└── new-ship.js      # Ship creation
```

## 🚨 Rollback Plan

If this ship fails:
1. **Git Revert**: `git revert HEAD`
2. **Manual Cleanup**: `rm -rf .vibe scripts/vibe-*.js`
3. **Package.json**: Remove added scripts

---

**Plan Approved By**: [Your name]  
**Date**: $(date +%Y-%m-%d)
**Estimated Complexity**: 🟢 Simple
**Estimated Time**: 2 hours
EOF

# Create log.md
cat > .vibe/log.md << EOF
# Ship Log

## 🚢 The Commitment

I, [Your Name], commit to:
- Building ONE ship at a time
- Shipping daily (or declaring blockers)
- Documenting as I build
- Testing as I code
- NOT starting new features until current ships

First Ship: Adopt Vibeship Framework
Target: $(date +%Y-%m-%d) by 5 PM

Signed: [Your name]
Date: $(date +%Y-%m-%d)

---

## Ship #1: Adopt Vibeship Framework
**Started**: $(date)
**Goal**: Successfully integrate Vibeship into existing project
**Status**: 🚧 In Progress
**Notes**: Adding framework to existing $PROJECT_TYPE project

---
<!-- Newest entries at top -->
EOF

# Create ideas.md
cat > .vibe/ideas.md << 'EOF'
# Ideas Dock

> Every feature idea goes here. NOT in your code.

## 🚢 Ship Queue (Next 3 Ships)

2. [First real feature - what small improvement can you ship tomorrow?]
3. [Second feature - what would users notice?]
4. [Third feature - what would make this more useful?]

## 🌊 Ocean of Ideas (Someday/Maybe)

### Features
- [ ] [List all the features you've been thinking about]
- [ ] [Big features go here to get them out of your head]
- [ ] [Dream features for version 2.0]

### Technical Improvements
- [ ] Performance optimizations
- [ ] Better error handling
- [ ] Test coverage improvements
- [ ] Code refactoring

### Business Ideas
- [ ] User feedback system
- [ ] Analytics integration
- [ ] Premium features

---

*Remember: These are safe here. Focus on your current ship.*
EOF

# Create patterns.md
cat > .vibe/patterns.md << 'EOF'
# Allowed Patterns

> Consistency matters. Use these patterns. Only these patterns.

## 🏗️ Architecture Patterns

### File Organization
```
✅ DO: [Your existing patterns]
✅ DO: Keep existing structure until Ship #10
✅ DO: Document decisions as you go

❌ DON'T: Refactor everything at once
❌ DON'T: Change file structure mid-ship
❌ DON'T: Break existing patterns without planning
```

### Component Structure
```
[Copy your existing patterns here]
[Example: How you currently structure components]
[Example: Your naming conventions]
```

## 💻 Coding Patterns

### Error Handling
```
[Your current error handling patterns]
```

### State Management
```
[Your current state management approach]
```

## 🎨 UI Patterns

### Styling
```
[Your current styling approach]
[CSS/SCSS/Styled-components/etc.]
```

## 🚫 Project-Specific Rules

1. **Don't break existing functionality** - Ship #1 rule
2. **Use existing dependencies** until Ship #5
3. **Keep current architecture** until users complain
4. **No major refactors** until Ship #10
5. **Test everything** before shipping

## 📏 Ship Sizes

**Choose the right size:**
- 🟢 **Small (< 4 hours)**: Single component, clear scope
- 🟡 **Medium (4-8 hours)**: Multiple files, one feature  
- 🔴 **Large (> 8 hours)**: STOP! Break into smaller ships

---

*Add your own patterns as you establish them.*
EOF

# Update package.json if it exists
if [ -f "package.json" ]; then
    echo -e "${BLUE}📦 Adding vibe commands to package.json...${NC}"
    
    # Create backup
    cp package.json package.json.backup
    
    # Add scripts using Node.js to handle JSON properly
    node << 'SCRIPT'
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));

// Add vibe scripts
pkg.scripts = pkg.scripts || {};
Object.assign(pkg.scripts, {
  "vibe": "node -e \"const fs=require('fs'); const c=fs.readFileSync('.vibe/current.md','utf8'); const m=c.match(/# Current Ship: #(\\\\d+) - ([^\\\\n]+)/); const s=c.match(/\\\\*\\\\*Status\\\\*\\\\*: ([^\\\\n]+)/); const t=(c.match(/\\\\[x\\\\]/g)||[]).length; const tt=(c.match(/\\\\[ \\\\]/g)||[]).length+t; console.log('\\\\n🚢 Ship #'+(m?m[1]:'?')+': '+(m?m[2]:'Unknown')+'\\\\n📊 Status: '+(s?s[1]:'Unknown')+'\\\\n✅ Progress: '+t+'/'+tt+' tasks ('+Math.round(t/tt*100)+'%)\\\\n');\"",
  "vibe:new": "node scripts/new-ship.js",
  "vibe:ship": "npm test && npm run build",
  "vibe:metrics": "node scripts/vibe-metrics.js",
  "vibe:help": "echo '\\n🚢 VIBESHIP COMMANDS\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\nnpm run vibe         - Current ship status\\nnpm run vibe:new     - Start a new ship\\nnpm run vibe:ship    - Run all checks\\nnpm run vibe:metrics - Full metrics report\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n'"
});

fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));
SCRIPT

    echo -e "${GREEN}✅ Added vibe commands to package.json${NC}"
fi

# Create basic script files (simplified versions)
cat > scripts/vibe-metrics.js << 'SCRIPT'
#!/usr/bin/env node
console.log('\n🚢 VIBESHIP METRICS\n');
console.log('📊 Run this after you complete a few ships!');
console.log('🎯 For now, focus on Ship #1\n');
SCRIPT

cat > scripts/new-ship.js << 'SCRIPT'
#!/usr/bin/env node
console.log('\n🚢 NEW SHIP CREATOR\n');
console.log('📋 Complete Ship #1 first!');
console.log('💡 Then run this to create Ship #2\n');
SCRIPT

chmod +x scripts/*.js

# Update .gitignore
if [ -f .gitignore ]; then
    echo -e "${BLUE}📝 Updating .gitignore...${NC}"
    echo "" >> .gitignore
    echo "# Vibeship" >> .gitignore
    echo ".vibe/metrics.json" >> .gitignore
    echo ".vibe/archive/" >> .gitignore
fi

# Create .cursorrules if it doesn't exist
if [ ! -f .cursorrules ]; then
    echo -e "${BLUE}🤖 Creating .cursorrules...${NC}"
    cat > .cursorrules << 'EOF'
# Vibeship AI Assistant Rules

You are an AI assistant following the Vibeship framework for progressive software development.

## 🚢 Core Principles

1. **One Ship at a Time**: Focus ONLY on .vibe/current.md
2. **No Breaking Changes**: This is an existing project - be careful
3. **Document Everything**: Update docs with every change
4. **Test as You Build**: Don't break existing functionality

## 📁 This is an EXISTING Project

- Don't refactor unless explicitly asked
- Don't change existing patterns
- Don't break existing tests
- Focus on additive changes only

## Current Ship

Check .vibe/current.md for what we're building TODAY.

The user is adopting Vibeship on an existing codebase. Be extra careful not to break anything.
EOF
fi

# Git commit
git add .
git commit -m "🚢 Add Vibeship framework to existing project" 2>/dev/null || echo -e "${YELLOW}⚠️ No changes to commit (that's ok)${NC}"

# Success message
echo ""
echo -e "${GREEN}✅ VIBESHIP ADDED SUCCESSFULLY!${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}📋 NEXT STEPS (Do These NOW!)${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "1. Edit .vibe/state.md - Document your current architecture"
echo "2. Edit .vibe/ideas.md - Brain dump ALL your planned features"
echo "3. Edit .vibe/patterns.md - Add YOUR project's patterns"
echo "4. Complete Ship #1 by documenting everything"
echo "5. Run 'npm run vibe:new' - Start your first real feature ship"
echo ""
echo -e "${BLUE}Test it worked:${NC}"
echo "   npm run vibe"
echo ""
echo -e "${GREEN}Welcome to shipping daily! 🚢${NC}"
echo ""
SCRIPT