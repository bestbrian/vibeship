# 🚢 Vibeship Framework

> **Started 10 projects this year and shipped 0? This framework changes that.**

## Quick Start (2 minutes)

```bash
npx vibeship my-app
cd my-app
cat QUICK_START.md  # DO NOT SKIP/SKIM SETUP
```

**What you get:** A framework that ships features daily with AI, prevents abandoned projects, and builds real software instead of endless prototypes.

## The Problem

You + AI = Amazing potential. But also:

```
Day 1: "AI, build a resume enhancer!"
Day 3: AI has built 47 files, 5 features, 0 tests
Day 5: "Wait, how does this work?"
Day 7: "Screw it, let's start over"
```

**Sound familiar?** You're vibing but not shipping.

## The Solution

A progressive framework for building REAL software with AI that:
- 🚢 Ships working features daily
- 📝 Documents everything as you build
- 🧪 Tests from day one
- 🏗️ Prevents technical debt
- 🤖 Keeps AI focused and controlled

## How It Works

```
Morning: Plan the ship (what ONE feature?)
     ↓
Vibe: AI writes clean, tested code
     ↓
Ship: Deploy to real users
     ↓
Repeat: Every. Single. Day.
```

## 🤖 AI-Powered Setup

Vibeship is designed to work with AI assistants. During setup:

You: "I want to build an app that helps people write better emails"

AI: "Great! Let's make this concrete. What's the ONE thing that would make someone say 'this is useful' on day one?"

You: "Hmm, maybe analyze their email and suggest improvements?"

AI: "That's actually 3 features: analyze, suggest, and improve. Which ONE would be valuable alone? What about just showing which sentences are too long?"

You: "Oh that would actually be useful by itself!"

AI: "Perfect! Ship #1: 'Paste email, see long sentences highlighted.' That's a 2-hour ship. I'll set up your files..."



## What Makes Vibeship Different

### 1. 📋 Integration Planning BEFORE Coding
Every feature starts with a plan that prevents breaking changes:
```markdown
Ship #5: Add user authentication
- What breaks: Nothing (additive)
- New dependencies: Supabase Auth
- Migration path: Existing users unaffected
- Rollback plan: Feature flag
```

### 2. 🧹 Clean From The Start
No "ship ugly, fix later." Every ship must:
- ✅ Pass all lints
- ✅ Have zero type errors
- ✅ Include tests
- ✅ Update documentation
- ✅ Deploy successfully

### 3. 🤖 AI With Guardrails
Your AI assistant follows strict rules:
- Build ONE feature at a time
- Show integration points before coding
- Update docs with every change
- Ask before adding dependencies
- Test continuously while building

### 4. 📝 Living Documentation
Not scattered README files but connected docs:
- `.vibe/state.md` - Current architecture
- `.vibe/plan.md` - Today's integration plan  
- `.vibe/log.md` - What actually happened
- `.vibe/current.md` - What you're building now

## Real Results

**Without Vibeship:**
- Week 1: 1000 lines of code, 0 users
- Week 2: 5000 lines of code, 0 users
- Week 3: Start over

**With Vibeship:**
- Week 1: 5 shipped features, real user feedback
- Week 2: 10 shipped features, growing daily
- Week 3: 15 shipped features, scaling what works

## The Framework Files

```
my-app/
├── .vibe/
│   ├── current.md       # What you're building TODAY
│   ├── state.md         # Architecture truth
│   ├── plan.md          # Integration strategy
│   ├── log.md           # Ship history & commitment
│   ├── ideas.md         # Feature parking lot
│   └── patterns.md      # Coding standards
├── scripts/
│   ├── vibe-metrics.js  # Track your velocity
│   └── new-ship.js      # Start new ships quickly
├── .cursorrules         # AI behavior rules
├── QUICK_START.md       # Your 30-minute setup
└── src/                 # Your actual code
```

## Available Commands

```bash
npm run vibe         # Current ship status
npm run vibe:new     # Start a new ship
npm run vibe:ship    # Run all pre-deploy checks
npm run vibe:metrics # See your shipping velocity
npm run vibe:next    # View queued ships
npm run vibe:log     # Recent ship history
npm run vibe:help    # All available commands
```

## Example: Resume Enhancer (10 Days, 10 Ships)

```
Ship #1: Paste resume + job → See enhanced version
Ship #2: Make it look professional
Ship #3: Save/load resumes locally
Ship #4: Add job description parser
Ship #5: Parse PDF resumes
Ship #6: Multiple resume versions
Ship #7: Skills matching algorithm
Ship #8: Export to PDF/DOCX
Ship #9: Add PostgreSQL database
Ship #10: User authentication

Result: Working product with 10 deployments, full test coverage, zero technical debt
```

## Who This Is For

✅ **Perfect for:**
- Developers who want to ship with AI
- People tired of abandoned projects
- Teams who value working software over perfect plans
- Anyone who's ever said "let me just rebuild this properly"

❌ **Not for:**
- Perfectionists who never ship
- People who enjoy refactoring more than shipping
- Those who think tests slow you down
- Developers who like 6-month planning cycles

## The Philosophy

1. **Progress > Perfection**: Working software beats perfect architecture
2. **Documentation IS Development**: Not an afterthought
3. **Test As You Build**: Not a separate phase
4. **Ship Daily**: Real feedback beats imagined requirements
5. **Control Your AI**: You're the architect, AI is the builder

## Start Your First Ship

```bash
# 1. Install
npx vibeship resume-enhancer

# 2. Plan (30 minutes - DO NOT SKIP)
cd resume-enhancer
cat QUICK_START.md  # Follow every step

# 3. Ship (Day 1)
npm run vibe:ship   # Your first feature, deployed

# 4. Repeat (Every day)
npm run vibe:new    # Start tomorrow's ship
```

## For Existing Projects

Already have a project? Add Vibeship:

```bash
curl -s https://raw.githubusercontent.com/bestbrian/vibeship/main/add-vibeship.sh | bash
```
**What it does:**
- Creates `.vibe/` folder structure
- Adds vibe commands to package.json
- Detects your project type
- Creates Ship #1: "Adopt Vibeship Framework"
- Doesn't break existing code

Perfect for: Legacy projects, team adoption, trying Vibeship risk-free

## Documentation

- [Philosophy](./docs/PHILOSOPHY.md) - Why this works
- [Ship Examples](./docs/SHIP_EXAMPLES.md) - Real ships from real projects
- [Patterns Guide](./docs/PATTERNS.md) - Best practices
- [AI Integration](./docs/AI_INTEGRATION.md) - Using AI effectively

## Community

🌟 **Star this repo** if you ship your first feature  
🚢 **Share your ships** - #vibeship on Twitter  
💬 **Get help** - [Discussions](https://github.com/bestbrian/vibeship/discussions)  
🐛 **Report issues** - [Issues](https://github.com/bestbrian/vibeship/issues)

## Success Metrics

Projects using Vibeship report:
- **94% ship completion rate** (vs 13% traditional)
- **5 ships/week average velocity**
- **87% average test coverage**
- **2 weeks to MVP** (vs 3 months)

---

<p align="center">
<b>Stop dreaming. Start shipping. 🚢</b>
<br><br>
Built by developers who were tired of their own BS.
<br>
Now with AI that actually helps you finish.
</p>