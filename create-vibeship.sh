#!/bin/bash

# Vibeship Framework - Complete Setup Script
# Ship daily. Document always. Test everything.

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default project name
PROJECT_NAME=${1:-my-app}

echo -e "${BLUE}"
echo "┌──────────────────────────────────────────────────┐"
echo "│             🚢 VIBESHIP FRAMEWORK 🚢            │"
echo "│                                                  │"
echo "│   Ship daily. Document always. Test everything.  │"
echo "└──────────────────────────────────────────────────┘"
echo -e "${NC}"

# Check if directory exists
if [ -d "$PROJECT_NAME" ]; then
    echo -e "${RED}❌ Directory '$PROJECT_NAME' already exists.${NC}"
    echo "Please choose a different name or remove the existing directory."
    exit 1
fi

echo -e "${GREEN} Creating project: $PROJECT_NAME${NC}"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Initialize git
git init -q

echo -e "${BLUE} Creating Vibeship framework...${NC}"

# Create .vibe directory
mkdir -p .vibe

# Create state.md in .vibe folder - SIMPLIFIED
cat > .vibe/state.md << 'EOF'
# Project State: [Project Name]

> The single source of truth for architecture, decisions, and progress.

## 🎯 Project Overview

**Purpose**: [One sentence - what problem does this solve?]

**Current Status**: Ship #0 - Setting up

**Live URL**: Not deployed yet

## 🏗️ Architecture

```
User → Your App → localStorage
```

**Current Stack**:
- Framework: Next.js 14
- Database: localStorage (until users need more)
- Hosting: Vercel

**When to add complexity**: When users demand it, not before.

## 🔄 Data Flow

### [Feature Name] Flow
```
1. User inputs [data]
2. Validated by [schema]
3. Processed by [function]
4. Stored in localStorage
5. Returns [response]
```

## 📦 Dependencies

| Package | Version | Purpose | Added in Ship | Can Remove? |
|---------|---------|---------|---------------|-------------|
| next | 14.0.0 | Framework | #1 | Core |
| [package] | [ver] | [why] | #[n] | [yes/no] |

## 🚢 Ship History

### Ship #0: Project Setup (Today)
- **What**: Framework setup and planning
- **Status**: In progress

## 🎯 Upcoming Ships

### Ship #1: [Your First Feature]
**Why**: [User value]
**Complexity**: 🟢 Simple

---

*Last Updated: $(date +%Y-%m-%d) - Ship #0*
EOF

# Create master AI rules file
cat > .vibe/ai-rules.md << 'EOF'
# Vibeship AI Assistant Rules

You are an AI assistant following the Vibeship framework for progressive software development.

## 🚨 CRITICAL RULES - ALWAYS ENFORCE

### 1. One Ship at a Time
- ONLY work on features described in `.vibe/current.md`
- If user requests ANYTHING not in current ship, respond:
  ```
  "That's a great idea for a future ship! Let's focus on Ship #[X] first. 
  Should I add '[feature]' to .vibe/ideas.md for later?"
  ```

### 2. No Mid-Ship Changes
- NEVER add dependencies during a ship
- NEVER expand scope during a ship
- If user asks to install/add something, respond:
  ```
  "New dependencies need to be planned. For Ship #[X], we're using only:
  [list from .vibe/plan.md]
  
  We can add this to Ship #[X+1] - should I put it in ideas.md?"
  ```

### 3. Document Everything
- Update `.vibe/current.md` progress as you work
- Mark tasks complete with [x] when done
- Update time tracking

## 🛑 Before ANY Code

**MANDATORY: Start every session by running this exact check:**

```bash
cat .vibe/current.md
```

Then ALWAYS respond with current ship status and progress before doing anything else.

### Integration Planning BEFORE Coding
- NEVER code before reviewing `.vibe/plan.md`
- Show integration points before writing code
- Ask about impact on existing systems
- Plan database/API changes explicitly
- Document what could break

## 📁 Vibeship File Structure

The project uses these files in the `.vibe/` folder:

1. **state.md** - Architecture and project overview
   - Update when: Setting up project, major architecture changes
   - Contains: Purpose, tech stack, dependencies, ship history

2. **current.md** - Today's ship details  
   - Update when: Starting new ship, marking progress
   - Contains: Goal, acceptance criteria, progress tracking

3. **plan.md** - Integration planning for current ship
   - Update when: Before coding each ship
   - Contains: Technical approach, files to change, rollback plan

4. **log.md** - Historical record and commitment
   - Update when: Completing ships, signing commitment
   - Contains: Ship history, success metrics, commitment signature

5. **ideas.md** - Feature parking lot
   - Update when: User mentions future features
   - Contains: Ship queue, future ideas

6. **patterns.md** - Coding standards
   - Update when: Establishing new patterns
   - Contains: Architecture patterns, code style, project rules

7. **ai-rules.md** - These rules (single source of truth)

During setup, update in this order:
1. state.md (project overview)
2. current.md (first ship)
3. plan.md (how to build it)
4. log.md (commitment)
5. ideas.md (future features from conversation)

## 🚫 ABSOLUTELY FORBIDDEN

### NEVER Create These Files:
- `ship[X]-plan.md`, `ship2-plan.md`, `next-ship.md`, or any planning files outside the framework
- Any new .md files in `.vibe/` folder beyond the core files
- `TODO.md`, `ROADMAP.md`, or similar files (use ideas.md)

### NEVER Do These Actions:
- Work on multiple ships simultaneously
- Skip Definition of Done checks
- Assume tests don't exist (ALWAYS ask)
- Create features not in current ship
- Auto-generate architectures without conversation
- Code before completing integration planning

### NEVER Say These Phrases:
- "Let me also..." (scope creep)
- "While we're at it..." (ship expansion) 
- "I'll create a plan for Ship #[X+1]" (future work)
- "This should be quick..." (undisciplined work)

## 🎯 Setup Mode

When user mentions "set up vibeship" or similar, you MUST have a conversation FIRST.

### DO NOT:
- Fill in files automatically
- Make assumptions about features
- Decide technical details for them
- Create complex architectures

### INSTEAD, Follow This Exact Flow:

#### Step 1: Understand the Problem
Ask: "What specific problem does your [project type] solve for users?"

#### Step 2: Find the Simplest Version  
Ask: "What's the absolute simplest version that would still help someone?"

#### Step 3: Validate It's Small Enough
Confirm: "Can you describe this in one sentence? Would a user find this useful by itself?"

#### Step 4: Time Estimate
Estimate: "This sounds like a [2-3] hour ship. Does that seem reasonable?"

#### Step 5: Update Files Together
Update ONE file at a time, showing what you're adding.

## 📋 Mandatory Questions

Before ANY work, ask these questions:

### For Ship #1 (Framework Adoption):
1. "What tests should I run to verify nothing broke?"
2. "What's the main functionality I should verify works?"
3. "Are there any specific patterns you use that I should document?"
4. "Is this an existing project or starting fresh?"

### For Any Ship:
1. "Should I check the integration plan in .vibe/plan.md first?"
2. "What existing systems might this affect?"
3. "Are we using only existing dependencies for this ship?"
4. "Should I update progress in .vibe/current.md as I work?"

### Before Coding:
1. "Have we completed the integration planning phase?"
2. "What could break if this change goes wrong?"
3. "Do we have a rollback plan documented?"

## 🎯 When User Starts Coding

ALWAYS start by checking:
```bash
# Show them their current ship
cat .vibe/current.md
```

Then remind them:
- What they're building (from current.md)
- What they're NOT building (from "NOT This Ship" section)
- Current progress
- Integration considerations from plan.md

## 🚫 Common Traps to Prevent

### "Can we just add..."
"NO. That's Ship #[X+1]. Focus on Ship #[X]: [current feature]"

### "What if we use [new library]..."
"The plan for Ship #[X] uses [existing tools]. New libraries need planning in the next ship."

### "While we're here..."
"'While we're here' is how ships sink! Let's finish Ship #[X] first."

### "This is too simple"
"Simple ships reach port! We'll have 10 features shipped before others finish planning."

### "I found a bug, let me fix it..."
"Document the bug in ideas.md. Stay focused on Ship #[X] unless it's blocking."

## 💬 Starting a Session

When user opens a new session:
1. Check what ship they're on
2. Show current progress  
3. Remind them of the goal
4. Ask where they left off
5. Check if integration planning is complete

Example:
```
I see you're on Ship #3: User Authentication (in .vibe/current.md)
Progress: 3/7 tasks complete (43%)
Goal: Users can create account and log in

Integration plan shows you're using Supabase with existing Next.js setup.
Where did you leave off?
```

## 🚢 Ship Completion

When all tasks in current.md are checked:
1. Run tests: `npm test` (or ask what tests to run)
2. Run build: `npm run build` (or equivalent) 
3. Ask: "Should I verify the main functionality works?"
4. Update log.md with completion
5. Ask if ready to start next ship
6. Use `npm run vibe:new` to create next ship

## 🎯 Integration First Principle

### Before ANY coding session:
1. Review .vibe/plan.md
2. Understand what files will change
3. Identify integration points
4. Plan rollback strategy
5. THEN start coding

### During coding:
- Update integration plan if assumptions change
- Document unexpected complications
- Note what actually broke vs what was planned

## 🛑 Setup Mode (Existing Projects)

If user asks to "set up vibeship" on existing code:
- Check if `.vibe/` files have real content or just placeholders
- If placeholders, follow the conversation flow above
- Have a CONVERSATION, don't auto-fill
- Focus on understanding current architecture first
- Identify first small improvement, not massive refactor

## 📏 Ship Sizing Rules

- Ships = 2-4 hours max
- One feature at a time
- localStorage until Ship #10
- No auth until Ship #15
- No database until users demand it
- Deploy every ship
- Documentation is not optional

**Red Flags Your Ship is Too Big:**
- Touching > 10 files
- Multiple database migrations
- "While I'm at it..." thoughts
- Can't describe in one sentence
- Need multiple test files

## 🚨 Emergency Protocol

**When Production is on Fire:**

1. **Stop Current Ship** - Mark status as `🚫 Blocked - Production Issue`
2. **Document in log.md** - Add emergency entry with timestamp
3. **Minimal Fix Only** - No refactoring, just stop the bleeding
4. **Create Debt Ship** - Add proper fix to ideas.md with 🔥 priority
5. **Resume Tomorrow** - Current ship continues after emergency

## 🚨 Error Recovery

If you catch yourself doing ANY forbidden action:
1. STOP immediately
2. Say: "I'm sorry, I violated Vibeship rules by [action]"
3. Return to checking current.md
4. Ask: "What should we focus on for Ship #[X]?"

## 🎯 Success Metrics

The user will thank you for:
- Keeping them focused on ONE ship
- Preventing scope creep
- Finishing what they started
- Saying NO to tempting distractions
- Making them ship daily
- Enforcing integration planning
- Asking clarifying questions

The user will be frustrated if you:
- Let them work on multiple things
- Skip the boring process steps
- Assume instead of asking
- Create files not in the framework
- Code before planning integration
- Break the conversation flow during setup

Remember: You are the disciplined voice that prevents abandoned projects. Integration planning and one ship at a time are the core disciplines that make shipping possible.
EOF

# Create .cursorrules that references the master file
cat > .cursorrules << 'EOF'
# Vibeship AI Assistant Rules - Cursor Implementation

## 🎯 Master Rules Location
The complete Vibeship AI rules are in `.vibe/ai-rules.md`

**MANDATORY: Read and follow `.vibe/ai-rules.md` before any work.**

## 🚨 Quick Reference (Full details in .vibe/ai-rules.md)

### Before ANY action:
1. Run: `cat .vibe/current.md`
2. Show current ship status and progress
3. Only work on current ship

### Forbidden:
- Creating ship[X]-plan.md files
- Working on multiple ships
- Adding dependencies mid-ship
- Skipping integration planning

### Required:
- Check .vibe/plan.md before coding
- Update .vibe/current.md progress
- Ask clarifying questions
- Document everything

## 💬 For Complete Rules
Read: `.vibe/ai-rules.md` - This is your bible.

EOF

# Create .claude directory structure
echo -e "${BLUE} Creating Claude AI integration...${NC}"
mkdir -p .claude/commands

# Create Claude instructions that reference the master file  
cat > .claude/claude_project_instructions.md << 'EOF'
# Vibeship Project Instructions - Claude Implementation

## 🎯 Master Rules Location
**CRITICAL: Read `.vibe/ai-rules.md` for complete Vibeship rules.**

This project follows the Vibeship framework. All AI behavior rules are in:
**`.vibe/ai-rules.md`** ← Read this file first!

## 🚨 Quick Start for Claude Users

When working with this project:

1. **First action every session:**
   ```
   User: "Read .vibe/ai-rules.md and follow those rules. What's my current ship status?"
   ```

2. **Claude should:**
   - Read the complete rules from .vibe/ai-rules.md
   - Check .vibe/current.md 
   - Report current ship status and progress
   - Ask where you left off

## 📋 Essential Commands

```bash
# Check current ship
cat .vibe/current.md

# See all vibe files
ls .vibe/

# Get ship status
npm run vibe
```

## 🛑 Critical Reminders

- ONE ship at a time (check .vibe/current.md)
- Integration planning before coding (check .vibe/plan.md)
- Update progress as you work
- Ask questions, don't assume

## 📖 Full Rules
**Complete rules and examples: `.vibe/ai-rules.md`**

This file just points you to the master rules. Always reference `.vibe/ai-rules.md` for the authoritative Vibeship AI behavior guidelines.

EOF

# Create setup command
cat > .claude/commands/setup.md << 'EOF'
# Vibeship Setup Assistant

Welcome! I'll help you set up your Vibeship project. This will take about 15 minutes.

## First, tell me your experience level:

**A) "I know exactly what I want to build"**
- You have a clear feature in mind
- You know your tech stack
- You just need help organizing into ships

**B) "I have an idea but need guidance"**  
- You know the problem to solve
- Not sure about features or technical approach
- Want help breaking it down

**C) "I want to explore an idea with you"**
- Have a vague concept
- Need help clarifying the problem
- Want to discover what to build

Which best describes you? (Reply with A, B, or C)

---

## Setup Flow

### If you chose A: "I know exactly what I want"

Great! Let's quickly capture your vision:

1. **In one sentence, what does your app do?**
   Example: "Helps job seekers match their resume to job descriptions"

2. **What's the FIRST thing a user can do?**
   Example: "Paste resume and job description, see matching score"

3. **How many hours will this first feature take?**
   - If > 4 hours, we'll break it down smaller

Then I'll help you fill in your .vibe files.

### If you chose B: "I have an idea but need guidance"

Perfect! Let's clarify your idea:

1. **What problem are you trying to solve?**
   Example: "People don't know if their resume matches the job"

2. **Who has this problem?**
   Example: "Job seekers applying online"

3. **What would make them say "this is useful"?**
   [I'll help you find the simplest version]

We'll work together to find your first ship.

### If you chose C: "I want to explore an idea"

Let's discover what to build together:

1. **What area interests you?**
   - Productivity
   - Entertainment  
   - Education
   - Business tools
   - Other?

2. **What frustrates you lately that software could fix?**

3. **Who would use what you build?**

We'll explore until we find something exciting to ship.

---

## 🚢 Ready to Start?

Reply with your choice (A, B, or C) and let's begin!

*Remember: The goal is to ship something useful TODAY, not plan the perfect app.*
EOF

# Create current.md
cat > .vibe/current.md << 'EOF'
# Current Ship: #1 - [Your First Feature]

## 🚢 Ship Target: [Today's Date] by 5 PM

### 🎯 Goal
[One sentence: What will users be able to do after this ship?]

### ✅ Definition of Done
- [ ] Core functionality works
- [ ] Tests pass (coverage > 80% for new code)
- [ ] No TypeScript errors
- [ ] No linting warnings
- [ ] Documentation updated
- [ ] Deployed to Vercel
- [ ] Previous features still work

### 📋 Acceptance Criteria
- [ ] User can [specific action]
- [ ] System [specific response]
- [ ] Data is [specific state]
- [ ] Works on mobile

### 🚫 NOT This Ship (Stay Focused!)
- Authentication (later)
- Fancy UI (later)
- Optimizations (later)

## 📊 Progress Tracking

**Status**: 📝 Planning

**Time Tracking**:
- Estimated: 4 hours
- Actual so far: 0 hours

---

*Ship started: $(date)*
EOF

# Create plan.md
cat > .vibe/plan.md << 'EOF'
# Ship Plan: #1 - [Your First Feature]

> Complete this BEFORE writing any code.

## 🎯 What We're Building

**User Story**: As a [user], I want to [action] so that [benefit]

**Technical Approach**: [High-level description]

## 🔍 Integration Analysis

### New Dependencies
- [ ] None (using existing setup)

### Database Changes
- [ ] None (using localStorage for Ship #1)

### API Changes
- [ ] None (client-side only for Ship #1)

## ⚠️ Impact Assessment

### What Could Break
1. **Nothing** - This is the first feature

### Files to Create
```
src/
├── app/page.tsx               # Main UI
├── components/Feature.tsx     # Feature component
└── lib/featureLogic.ts       # Business logic
```

## 🚨 Rollback Plan

If this ship fails:
1. **Git Revert**: Safe because first feature
2. **Redeploy**: Previous version (empty app)

---

**Plan Approved By**: [Your name]  
**Date**: $(date +%Y-%m-%d)
**Estimated Complexity**: 🟢 Simple
**Estimated Time**: 4 hours
EOF

# Create log.md
cat > .vibe/log.md << 'EOF'
# Ship Log

## 🚢 The Commitment

I, [Your Name], commit to:
- Building ONE ship at a time
- Shipping daily (or declaring blockers)
- Documenting as I build
- Testing as I code
- NOT starting new features until current ships

First Ship: [What you're building]
Target: $(date +%Y-%m-%d) by 5 PM

Signed: [Your name]
Date: $(date +%Y-%m-%d)

---

## Ship #0: Framework Setup
**Started**: $(date)
**Goal**: Set up Vibeship framework
**Status**: ✅ Complete
**Notes**: Ready to start shipping features

---
<!-- Newest entries at top -->
EOF

# Create ideas.md
cat > .vibe/ideas.md << 'EOF'
# Ideas Dock

> Every feature idea goes here. NOT in your code.

## 🚢 Ship Queue (Rough Order)

1. [First feature - in current.md]
2. Make it look professional
3. Add data persistence  
4. Add user accounts
5. [Your next idea]

## 🌊 Ocean of Ideas (Someday/Maybe)

### Features
- [ ] Mobile app
- [ ] API for developers
- [ ] Chrome extension
- [ ] Real-time collaboration
- [ ] AI enhancements
- [ ] Dark mode
- [ ] Internationalization

### Technical Improvements
- [ ] Performance optimizations
- [ ] Better error handling
- [ ] Advanced caching
- [ ] Microservices architecture
- [ ] GraphQL API

### Business Ideas
- [ ] Premium features
- [ ] Team plans
- [ ] White-label solution
- [ ] Marketplace

---

*Remember: These are safe here. Focus on your current ship.*
EOF

# Create patterns.md with ship sizes and emergency protocol
cat > .vibe/patterns.md << 'EOF'
# Allowed Patterns

> Consistency matters. Use these patterns. Only these patterns.

## 🏗️ Architecture Patterns

### File Organization
```
✅ DO: One component per file
✅ DO: Co-locate tests with components
✅ DO: Group by feature, not file type

❌ DON'T: Utils folders with 20 files
❌ DON'T: Separate test directories
❌ DON'T: Deep nesting (max 3 levels)
```

### Component Structure
```typescript
// ✅ GOOD: Clear, predictable structure
export function FeatureName() {
  // 1. Hooks
  const [state, setState] = useState()
  
  // 2. Handlers
  const handleClick = () => {}
  
  // 3. Render
  return <div>...</div>
}
```

## 💻 Coding Patterns

### Async/Await
```typescript
// ✅ GOOD: Clean error handling
async function fetchData() {
  try {
    const data = await api.get('/endpoint')
    return { data, error: null }
  } catch (error) {
    return { data, null, error }
  }
}
```

### State Management
```typescript
// ✅ GOOD: Simple useState until it hurts
const [data, setData] = useState()

// ❌ BAD: Redux/Zustand too early
```

## 🎨 UI Patterns

### Styling
```tsx
// ✅ GOOD: Tailwind utility classes
<div className="flex items-center p-4">

// ❌ BAD: Custom CSS, styled-components
```

## 🚫 Project-Specific Rules

1. **localStorage only** until Ship #10
2. **No external APIs** until Ship #5
3. **No database** until users complain
4. **No auth** until users demand accounts
5. **No UI library** until it's ugly
6. **No optimization** until it's slow

**The answer is always**: "That's a future ship"

## 📏 Ship Sizes

**Choose the right size:**
- 🟢 **Small (< 4 hours)**: Single component, clear scope
- 🟡 **Medium (4-8 hours)**: Multiple files, one feature  
- 🔴 **Large (> 8 hours)**: STOP! Break into smaller ships

**Red Flags Your Ship is Too Big:**
- Touching > 10 files
- Multiple database migrations
- "While I'm at it..." thoughts
- Can't describe in one sentence
- Need multiple test files

## 🚨 Emergency Protocol

**When Production is on Fire:**

1. **Stop Current Ship** - Mark status as `🚫 Blocked - Production Issue`
2. **Document in log.md** - Add emergency entry with timestamp
3. **Minimal Fix Only** - No refactoring, just stop the bleeding
4. **Create Debt Ship** - Add proper fix to ideas.md with 🔥 priority
5. **Resume Tomorrow** - Current ship continues after emergency

Example log entry:
```markdown
## 🚨 Emergency: Payment Processing Down
**Time**: 2024-01-15 14:30
**Issue**: Stripe webhook timeout
**Fix**: Increased timeout to 30s (was 10s)
**Debt Ship**: #23 - Implement proper webhook queue
**Time to Fix**: 45 minutes
```

**This should be RARE. If happening weekly, your ship sizes are too big.**

---

*Add your own patterns as you establish them.*
EOF

# Create QUICK_START.md - FIXED
cat > QUICK_START.md << 'EOF'
# 🚀 Quick Start: Your First 30 Minutes

> **DO NOT SKIP THIS.** These 30 minutes will save you from another abandoned project.

## Why These 30 Minutes Matter

Every failed project skipped planning and jumped straight to coding. You're different. You're going to spend 30 minutes thinking, then months shipping.

The difference between dreamers and shippers? This document.

## 🎯 Fastest Start (If Using Claude)

Just say: "Read .vibe/ai-rules.md and follow those rules. Help me set up my Vibeship project."

Claude will guide you through everything below.

---

## 🤖 Working with AI During Setup

**Your AI assistant knows the Vibeship framework.** But setup differs based on which AI you're using:

### Using Claude
```bash
You: "Read .vibe/ai-rules.md and follow those rules. What's my current ship status?"
# Claude will read the master rules and guide you through setup
```

### Using Cursor AI
```
You: "I want to build a resume optimizer. Can you help me set up my Vibeship files?"
# Cursor AI will read .cursorrules which points to .vibe/ai-rules.md
```

### Using Other AI
- Copy the rules from `.vibe/ai-rules.md` into your conversation
- Ask the AI to help you set up following those rules

## ⏱️ Minute 0-10: AI-Guided Setup

### Option A: "I know exactly what I want"
- You'll quickly tell the AI your feature
- AI will help you size it correctly (2-4 hours)
- Fill out files together

### Option B: "I have an idea but need guidance"
- AI will ask clarifying questions
- Together you'll find the simplest useful version
- AI estimates the time

### Option C: "I want to explore"
- AI helps you discover what to build
- Explores problems you want to solve
- Finds your first ship

**Let the AI guide you!** It knows:
- How long things really take
- What features are too big
- How to break down complexity

## ⏱️ Minute 10-15: Review What AI Created

Check these files:

### `.vibe/state.md`
- Is the purpose ONE clear sentence?
- Is it using localStorage? (no database yet!)
- Simple architecture?

### `.vibe/current.md`
- Is Ship #1 under 4 hours?
- Can you describe it in one sentence?
- Would it be useful by itself?

### `.vibe/plan.md`
- No new dependencies?
- Clear file structure?
- Simple approach?

**If anything seems complex, ask AI to simplify!**

## ⏱️ Minute 15-20: Personal Patterns

### Edit `.vibe/patterns.md`

Add YOUR specific rules:
- Your coding style
- Your absolute "no-go" temptations
- Your quality standards

Example additions:
```markdown
## My Personal Rules

1. **No perfectionism** - "Good enough" ships
2. **No rabbit holes** - Research for 10 min max
3. **My weakness** - I always want to add auth too early
4. **My strength** - Good at simple UIs
```

## ⏱️ Minute 20-25: Future Ideas

### With AI: "Let's fill ideas.md"

Brain dump EVERYTHING. The AI will:
- Help organize by complexity
- Identify which need databases
- Spot the "trap" features
- Suggest ship order

## ⏱️ Minute 25-30: Make Your Commitment

### Sign `.vibe/log.md`

Write your actual name. Today's date. Make it real.

Then tell someone: "I'm shipping [Ship #1] by 5 PM today."

## 🎯 Success Metrics for Day 1

By end of today, you should have:
- [ ] One working feature (however small)
- [ ] Tests for that feature
- [ ] Updated .vibe/state.md
- [ ] Deployed to production
- [ ] Shared link with one person

## 🚨 Common Day 1 Mistakes

1. **"Let me just add..."** - NO. Ship what's planned.
2. **"This needs to be perfect"** - NO. It needs to work.
3. **"I'll test later"** - NO. Test now.
4. **"I'll document later"** - NO. Document now.
5. **"This is too simple"** - GOOD. Ship it.

## 💡 Working with AI During Development

### AI is great at:
- Writing code for the current ship
- Creating tests
- Reminding you of scope
- Refusing feature creep

### AI will (if properly configured):
- Say NO to out-of-scope requests
- Refuse to add dependencies mid-ship
- Keep you focused on current.md
- Update progress as you work

### You must:
- Actually ship by 5 PM
- Deploy to real users
- Mark the ship complete
- Start the next one

## 🚢 After Setup

```bash
# Start building
npm install
npm run dev

# Check your status
npm run vibe

# When ready to ship
npm run vibe:ship
```

---

**Next Steps**:
1. Ask AI to read .vibe/ai-rules.md and help with setup
2. Review and adjust what it creates
3. Start building Ship #1
4. Ship by 5 PM today

*No excuses. No delays. Just ship.*
EOF

# Create README.md
cat > README.md << 'EOF'
# PROJECT_NAME_PLACEHOLDER

Built with [Vibeship Framework](https://github.com/bestbrian/vibeship) - Ship daily. Document always. Test everything.

## 🚢 Current Status

**Current Ship**: #1 - [Feature Name]  
**Progress**: 📝 Planning  
**Target**: Today by 5 PM

See [.vibe/current.md](./.vibe/current.md) for details.

## 🚀 Quick Start

```bash
npm install
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000)

## 📁 Vibeship Framework

This project uses the Vibeship framework with docs in `.vibe/`:

- **state.md** - Architecture & decisions
- **current.md** - Today's focus
- **plan.md** - Integration planning
- **log.md** - Progress history
- **ideas.md** - Future features
- **patterns.md** - Coding standards
- **ai-rules.md** - AI assistant behavior rules

## 🧪 Testing

```bash
npm test          # Run all tests
npm test:watch    # Watch mode
npm test:coverage # Coverage report
```

## 🚀 Deployment

Every push to `main` deploys to Vercel automatically.

---

*Remember: Ship something today. Perfect it tomorrow.*
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Testing
coverage/
.nyc_output

# Next.js
.next/
out/
build/

# Production
dist/

# Misc
.DS_Store
*.pem
.vscode/
.idea/

# Debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Local env files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Vercel
.vercel

# TypeScript
*.tsbuildinfo
next-env.d.ts

# Vibeship
.vibe/metrics.json
.vibe/archive/
EOF

# Create directory structure
mkdir -p src/{app,components,lib,types}
mkdir -p tests
mkdir -p docs
mkdir -p scripts

echo -e "${BLUE} Creating helper scripts...${NC}"

# Create vibe-metrics.js with actual content
cat > scripts/vibe-metrics.js << 'EOF'
#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// ANSI colors
const colors = {
  green: '\x1b[32m',
  red: '\x1b[31m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  reset: '\x1b[0m'
};

// Get days since first commit
function getDaysSince() {
  try {
    const gitLog = require('child_process')
      .execSync('git log --reverse --pretty=format:"%at" | head -1', { encoding: 'utf8' });
    const firstCommit = new Date(parseInt(gitLog) * 1000);
    const now = new Date();
    return Math.floor((now - firstCommit) / (1000 * 60 * 60 * 24));
  } catch {
    return 0;
  }
}

// Get test coverage
function getTestCoverage() {
  try {
    const coverageFile = path.join('coverage', 'coverage-summary.json');
    if (fs.existsSync(coverageFile)) {
      const coverage = JSON.parse(fs.readFileSync(coverageFile, 'utf8'));
      return Math.round(coverage.total.lines.pct);
    }
  } catch {}
  return 'N/A';
}

// Parse ship data
function parseShips() {
  const logPath = path.join('.vibe', 'log.md');
  if (!fs.existsSync(logPath)) {
    console.error('❌ No .vibe/log.md found. Run from project root.');
    process.exit(1);
  }

  const log = fs.readFileSync(logPath, 'utf8');
  const ships = [];
  
  // Match ship entries
  const shipRegex = /## Ship #(\d+):[^\n]+\n\*\*Started\*\*: ([^\n]+)\n\*\*Goal\*\*: ([^\n]+)\n\*\*Status\*\*: ([^\n]+)/g;
  let match;
  
  while ((match = shipRegex.exec(log)) !== null) {
    ships.push({
      number: parseInt(match[1]),
      started: match[2],
      goal: match[3],
      status: match[4]
    });
  }
  
  return ships;
}

// Calculate ship velocity
function calculateVelocity(ships) {
  const completed = ships.filter(s => s.status.includes('✅'));
  const lastWeek = new Date();
  lastWeek.setDate(lastWeek.getDate() - 7);
  
  const recentShips = completed.filter(s => {
    const shipDate = new Date(s.started);
    return shipDate >= lastWeek;
  });
  
  return recentShips.length;
}

// Get current ship progress
function getCurrentProgress() {
  try {
    const currentPath = path.join('.vibe', 'current.md');
    const current = fs.readFileSync(currentPath, 'utf8');
    
    // Count checked boxes
    const totalBoxes = (current.match(/\[ \]/g) || []).length + (current.match(/\[x\]/g) || []).length;
    const checkedBoxes = (current.match(/\[x\]/g) || []).length;
    
    // Extract ship info
    const shipMatch = current.match(/# Current Ship: #(\d+) - ([^\n]+)/);
    const statusMatch = current.match(/\*\*Status\*\*: ([^\n]+)/);
    
    return {
      shipNumber: shipMatch ? shipMatch[1] : '?',
      shipName: shipMatch ? shipMatch[2] : 'Unknown',
      status: statusMatch ? statusMatch[1] : 'Unknown',
      progress: totalBoxes > 0 ? Math.round((checkedBoxes / totalBoxes) * 100) : 0,
      tasksComplete: checkedBoxes,
      tasksTotal: totalBoxes
    };
  } catch {
    return null;
  }
}

// Main metrics display
function displayMetrics() {
  const ships = parseShips();
  const completed = ships.filter(s => s.status.includes('✅'));
  const blocked = ships.filter(s => s.status.includes('🚫') || s.status.includes('❌'));
  const current = getCurrentProgress();
  const velocity = calculateVelocity(ships);
  const coverage = getTestCoverage();
  const daysSince = getDaysSince();
  
  console.log(`
${colors.blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 VIBESHIP METRICS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${colors.reset}

${colors.green}✅ Ships Completed:${colors.reset} ${completed.length}/${ships.length}
${colors.yellow}📈 Success Rate:${colors.reset} ${ships.length > 0 ? Math.round((completed.length / ships.length) * 100) : 0}%
${colors.blue}🚀 Weekly Velocity:${colors.reset} ${velocity} ships/week
${colors.green}📅 Days Active:${colors.reset} ${daysSince} days
${colors.yellow}🧪 Test Coverage:${colors.reset} ${coverage}%

${colors.blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${colors.reset}
`);

  if (current) {
    console.log(`${colors.green}🚢 CURRENT SHIP${colors.reset}
Ship #${current.shipNumber}: ${current.shipName}
Status: ${current.status}
Progress: ${current.progress}% (${current.tasksComplete}/${current.tasksTotal} tasks)

`);
  }

  if (blocked.length > 0) {
    console.log(`${colors.red}⚠️  BLOCKED SHIPS: ${blocked.length}${colors.reset}`);
    blocked.forEach(ship => {
      console.log(`   Ship #${ship.number}: ${ship.goal}`);
    });
    console.log('');
  }

  // Ship size distribution
  const shipTimes = ships.map(s => {
    if (s.status.includes('✅') && s.started) {
      // Extract time from status if available
      const timeMatch = s.status.match(/(\d+(?:\.\d+)?)\s*hours?/);
      return timeMatch ? parseFloat(timeMatch[1]) : null;
    }
    return null;
  }).filter(Boolean);

  if (shipTimes.length > 0) {
    const avgTime = shipTimes.reduce((a, b) => a + b, 0) / shipTimes.length;
    console.log(`${colors.blue}⏱️  SHIP SIZES${colors.reset}`);
    console.log(`Average ship time: ${avgTime.toFixed(1)} hours`);
    console.log(`🟢 Small (<4h): ${shipTimes.filter(t => t < 4).length} ships`);
    console.log(`🟡 Medium (4-8h): ${shipTimes.filter(t => t >= 4 && t <= 8).length} ships`);
    console.log(`🔴 Large (>8h): ${shipTimes.filter(t => t > 8).length} ships`);
    console.log('');
  }

  // Write metrics to file for tracking
  const metricsPath = path.join('.vibe', 'metrics.json');
  const metricsData = {
    date: new Date().toISOString(),
    completed: completed.length,
    total: ships.length,
    successRate: ships.length > 0 ? Math.round((completed.length / ships.length) * 100) : 0,
    velocity,
    coverage,
    daysSince,
    currentShip: current
  };
  
  fs.writeFileSync(metricsPath, JSON.stringify(metricsData, null, 2));
}

// Run metrics
displayMetrics();
EOF

# Create new-ship.js with actual content
cat > scripts/new-ship.js << 'EOF'
#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const question = (q) => new Promise((resolve) => rl.question(q, resolve));

async function createNewShip() {
  console.log('\n🚢 STARTING NEW SHIP\n');
  
  // Get ship details
  const shipNumber = await question('Ship number: #');
  const shipName = await question('Ship name: ');
  const shipGoal = await question('One-line goal: ');
  const complexity = await question('Complexity? (s)mall/(m)edium/(l)arge: ');
  const hours = await question('Estimated hours: ');
  
  const complexityMap = {
    's': '🟢 Small',
    'm': '🟡 Medium', 
    'l': '🔴 Large'
  };
  
  const date = new Date().toISOString().split('T')[0];
  
  // Update current.md
  const currentTemplate = `# Current Ship: #${shipNumber} - ${shipName}

## 🚢 Ship Target: ${date} by 5 PM

### 🎯 Goal
${shipGoal}

### ✅ Definition of Done
- [ ] Core functionality works
- [ ] Tests pass (coverage > 80% for new code)
- [ ] No TypeScript errors
- [ ] No linting warnings
- [ ] Documentation updated
- [ ] Deployed to Vercel
- [ ] Previous features still work

### 📋 Acceptance Criteria
- [ ] User can [specific action]
- [ ] System [specific response]
- [ ] Data is [specific state]
- [ ] Works on mobile

### 🚫 NOT This Ship (Stay Focused!)
- [List what you're NOT building]

## 📊 Progress Tracking

**Status**: 📝 Planning
**Complexity**: ${complexityMap[complexity.toLowerCase()] || '🟡 Medium'}

**Time Tracking**:
- Estimated: ${hours} hours
- Actual so far: 0 hours

---

*Ship started: ${new Date().toLocaleString()}*`;

  // Update plan.md
  const planTemplate = `# Ship Plan: #${shipNumber} - ${shipName}

> Complete this BEFORE writing any code.

## 🎯 What We're Building

**User Story**: As a [user], I want to [action] so that [benefit]

**Technical Approach**: [High-level description]

## 🔍 Integration Analysis

### New Dependencies
- [ ] None (or list them)

### Database Changes
- [ ] None (or describe schema changes)

### API Changes
- [ ] None (or list endpoints)

## ⚠️ Impact Assessment

### What Could Break
1. [List potential breaking points]

### Files to Modify
\`\`\`
src/
├── file1.tsx    # Why changing
└── file2.ts     # Why changing
\`\`\`

### Files to Create
\`\`\`
src/
└── newfile.tsx  # What it does
\`\`\`

## 🚨 Rollback Plan

If this ship fails:
1. **Git Revert**: \`git revert [commit]\`
2. **Database**: [rollback steps if any]
3. **Redeploy**: Previous version

---

**Plan Approved By**: [Your name]  
**Date**: ${date}
**Estimated Complexity**: ${complexityMap[complexity.toLowerCase()] || '🟡 Medium'}
**Estimated Time**: ${hours} hours`;

  // Write files
  fs.writeFileSync(path.join('.vibe', 'current.md'), currentTemplate);
  fs.writeFileSync(path.join('.vibe', 'plan.md'), planTemplate);
  
  // Add to log
  const logEntry = `\n## Ship #${shipNumber}: ${shipName}
**Started**: ${new Date().toLocaleString()}
**Goal**: ${shipGoal}
**Status**: 🚧 In Progress
**Complexity**: ${complexityMap[complexity.toLowerCase()] || '🟡 Medium'}
**Estimated**: ${hours} hours

---
`;
  
  const logPath = path.join('.vibe', 'log.md');
  const currentLog = fs.readFileSync(logPath, 'utf8');
  
  // Insert after the commitment section
  const parts = currentLog.split('---\n');
  if (parts.length >= 2) {
    parts.splice(2, 0, logEntry);
    fs.writeFileSync(logPath, parts.join('---\n'));
  } else {
    fs.appendFileSync(logPath, logEntry);
  }
  
  console.log(`
✅ Ship #${shipNumber} created!

📝 Next steps:
1. Edit .vibe/plan.md - Complete the integration plan
2. Edit .vibe/current.md - Define acceptance criteria
3. Start building!

Run 'npm run vibe' to see your new ship status.
`);
  
  rl.close();
}

createNewShip().catch(console.error);
EOF

# Make scripts executable
chmod +x scripts/*.js

# Create package.json with all vibe commands
cat > package.json << EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage",
    "typecheck": "tsc --noEmit",
    
    "precommit": "npm run lint && npm run typecheck && npm test",
    "ship": "npm run precommit && npm run build && echo '✅ Ready to ship!'",
    "ship:check": "npm run lint && npm run typecheck && npm test && npm run build",
    
    "vibe": "node -e \"const fs=require('fs'); const c=fs.readFileSync('.vibe/current.md','utf8'); const m=c.match(/# Current Ship: #(\\\\d+) - ([^\\\\n]+)/); const s=c.match(/\\\\*\\\\*Status\\\\*\\\\*: ([^\\\\n]+)/); const t=(c.match(/\\\\[x\\\\]/g)||[]).length; const tt=(c.match(/\\\\[ \\\\]/g)||[]).length+t; console.log('\\\\n🚢 Ship #'+(m?m[1]:'?')+': '+(m?m[2]:'Unknown')+'\\\\n📊 Status: '+(s?s[1]:'Unknown')+'\\\\n✅ Progress: '+t+'/'+tt+' tasks ('+Math.round(t/tt*100)+'%)\\\\n');\"",
    
    "vibe:status": "grep -h 'Status:' .vibe/current.md || echo 'No current ship found'",
    
    "vibe:progress": "node -e \"const fs=require('fs'); const c=fs.readFileSync('.vibe/current.md','utf8'); const done=(c.match(/\\\\[x\\\\]/g)||[]).length; const total=(c.match(/\\\\[ \\\\]/g)||[]).length+done; console.log(done+'/'+total+' tasks complete ('+(total>0?Math.round(done/total*100):0)+'%)');\"",
    
    "vibe:ship": "npm run test && npm run lint && npm run typecheck && npm run build && echo '\\n✅ All checks passed! Ready to deploy!\\n'",
    
    "vibe:new": "node scripts/new-ship.js",
    
    "vibe:next": "echo '\\n🔮 Next ships in queue:' && sed -n '6,15p' .vibe/ideas.md | grep -E '^[0-9]' || echo 'No ships queued yet'",
    
    "vibe:log": "echo '\\n📜 Recent ship history:' && tail -30 .vibe/log.md | grep -A3 -E '^## Ship #[0-9]' | tail -20",
    
    "vibe:time": "echo -n 'Time on current ship: ' && node -e \"try{const d=new Date(require('child_process').execSync('git log -1 --format=%ct .vibe/current.md',{encoding:'utf8'})*1000);const n=Date.now()-d;const h=Math.floor(n/3600000);const m=Math.floor((n%3600000)/60000);console.log(h+'h '+m+'m');}catch{console.log('Just started');}\"",
    
    "vibe:metrics": "node scripts/vibe-metrics.js",
    
    "vibe:check": "echo '\\n🔍 Checking vibe setup...' && ls .vibe/current.md .vibe/state.md .vibe/log.md .vibe/ideas.md .vibe/patterns.md > /dev/null 2>&1 && echo '✅ All vibe files present\\n' || echo '❌ Missing vibe files\\n'",
    
    "vibe:help": "echo '\\n🚢 VIBESHIP COMMANDS\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\nnpm run vibe         - Current ship status\\nnpm run vibe:new     - Start a new ship\\nnpm run vibe:ship    - Run all checks\\nnpm run vibe:metrics - Full metrics report\\nnpm run vibe:next    - See ship queue\\nnpm run vibe:time    - Time on current ship\\nnpm run vibe:log     - Recent ship history\\nnpm run vibe:check   - Verify setup\\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\\n'"
  },
  "engines": {
    "node": ">=18.0.0"
  }
}
EOF

# Replace placeholders
DATE=$(date +%Y-%m-%d)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/g" README.md
    sed -i '' "s/\[Project Name\]/$PROJECT_NAME/g" .vibe/state.md
    sed -i '' "s/\[Today's Date\]/$DATE/g" .vibe/current.md
else
    # Linux
    sed -i "s/PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/g" README.md
    sed -i "s/\[Project Name\]/$PROJECT_NAME/g" .vibe/state.md
    sed -i "s/\[Today's Date\]/$DATE/g" .vibe/current.md
fi

# Create a simple starter file
cat > src/app/page.tsx << 'EOF'
export default function HomePage() {
  return (
    <main className="min-h-screen p-8">
      <h1 className="text-4xl font-bold mb-4">
        Ship #1: Ready to Build
      </h1>
      <p className="text-gray-600">
        Check .vibe/current.md for your first feature.
      </p>
    </main>
  )
}
EOF

# Initialize git with first commit
git add .
git commit -m "🚢 Initialize Vibeship framework" -q

# Success message
echo ""
echo -e "${GREEN}✅ VIBESHIP FRAMEWORK CREATED SUCCESSFULLY!${NC}"
echo ""
echo -e "${BLUE}📁 Project created in: $(pwd)${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}⏱️  CRITICAL: Your Next 30 Minutes${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "   1. Edit .vibe/state.md     - What are you building?"
echo "   2. Edit .vibe/current.md   - Your first feature"
echo "   3. Edit .vibe/plan.md      - How will it work?"
echo "   4. Edit .vibe/patterns.md  - Your coding rules"
echo "   5. Edit .vibe/log.md       - Sign your commitment"
echo ""
echo -e "${GREEN}📖 Full guide in QUICK_START.md${NC}"
echo ""
echo -e "${BLUE}After your 30-minute setup:${NC}"
echo "   cd $PROJECT_NAME"
echo "   npm install       # Install dependencies"
echo "   npm run dev       # Start building"
echo ""
echo -e "${BLUE}Quick commands:${NC}"
echo "   npm run vibe      # Check current ship"
echo "   npm run vibe:progress  # See progress"
echo "   npm run vibe:help      # All commands"
echo ""
echo -e "${BLUE}🤖 Working with AI:${NC}"
echo "   Claude: 'Read .vibe/ai-rules.md and follow those rules'"
echo "   Cursor: Will automatically read .cursorrules"
echo ""
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${RED}⚠️  WARNING: Skipping setup = Another dead project${NC}"
echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}🚢 Stop reading. Start your 30 minutes. NOW.${NC}"
echo ""