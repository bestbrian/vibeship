#!/usr/bin/env node

const https = require('https');
const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

// Parse command line args
const args = process.argv.slice(2);
const command = args[0];

// Colors for output
const colors = {
  blue: '\x1b[34m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  reset: '\x1b[0m'
};

// Determine if this is an init command or create command
if (command === 'init') {
  // Handle adding Vibeship to existing project
  initExistingProject();
} else if (command === '--help' || command === '-h') {
  showHelp();
} else if (command === '--version' || command === '-v') {
  const packageJson = require('./package.json');
  console.log(packageJson.version);
} else {
  // Default behavior: create new project
  const projectName = command || 'my-app';
  createNewProject(projectName);
}

function showHelp() {
  console.log(`
${colors.blue}Vibeship - Ship daily. Document always. Test everything.${colors.reset}

Usage:
  ${colors.green}vibeship <project-name>${colors.reset}    Create a new Vibeship project
  ${colors.green}vibeship init${colors.reset}             Add Vibeship to existing project
  ${colors.green}vibeship --help${colors.reset}           Show this help message
  ${colors.green}vibeship --version${colors.reset}        Show version number

Examples:
  ${colors.yellow}npx vibeship my-app${colors.reset}       Create new project called 'my-app'
  ${colors.yellow}npx vibeship init${colors.reset}         Add Vibeship to current directory
`);
}

function createNewProject(projectName) {
  console.log(`${colors.blue}🚢 Creating Vibeship project: ${projectName}${colors.reset}`);

  // Check if directory already exists
  if (fs.existsSync(projectName)) {
    console.error(`${colors.red}❌ Directory '${projectName}' already exists${colors.reset}`);
    process.exit(1);
  }

  // Download and run the creation script
  const scriptUrl = 'https://raw.githubusercontent.com/bestbrian/vibeship/main/create-vibeship.sh';
  downloadAndRunScript(scriptUrl, [projectName], () => {
    console.log(`${colors.green}✅ Project created successfully!${colors.reset}`);
    console.log(`${colors.yellow}Next steps:${colors.reset}`);
    console.log(`  cd ${projectName}`);
    console.log(`  cat QUICK_START.md  # Follow the 30-minute setup`);
  });
}

function initExistingProject() {
  console.log(`${colors.blue}🚢 Adding Vibeship to existing project${colors.reset}`);

  // Check if we're in a valid project directory
  if (!fs.existsSync('package.json')) {
    console.error(`${colors.red}❌ No package.json found. Please run this command in your project root.${colors.reset}`);
    process.exit(1);
  }

  // Check if .vibe directory already exists
  if (fs.existsSync('.vibe')) {
    console.error(`${colors.red}❌ Vibeship already initialized (found .vibe directory)${colors.reset}`);
    console.log(`${colors.yellow}💡 To reinitialize, remove the .vibe directory first${colors.reset}`);
    process.exit(1);
  }

  // Confirm with user
  console.log(`${colors.yellow}This will add Vibeship framework to your current project.${colors.reset}`);
  console.log(`${colors.yellow}Files to be added:${colors.reset}`);
  console.log('  - .vibe/ (planning documents)');
  console.log('  - .cursorrules (AI integration)');
  console.log('  - .vibe/INTEGRATION.md (integration guide)');
  console.log('');
  
  // Simple confirmation using readline
  const readline = require('readline');
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  rl.question(`${colors.green}Continue? (y/N) ${colors.reset}`, (answer) => {
    rl.close();
    
    if (answer.toLowerCase() !== 'y' && answer.toLowerCase() !== 'yes') {
      console.log(`${colors.yellow}Operation cancelled.${colors.reset}`);
      process.exit(0);
    }

    // Download and run the add-vibeship script
    const scriptUrl = 'https://raw.githubusercontent.com/bestbrian/vibeship/main/add-vibeship.sh';
    
    downloadAndRunScript(scriptUrl, [], () => {
      console.log(`${colors.green}✅ Vibeship added successfully!${colors.reset}`);
      console.log(`${colors.yellow}Next steps:${colors.reset}`);
      console.log(`  cat .vibe/state.md      # Document your architecture`);
      console.log(`  cat .vibe/current.md    # Review your first ship`);
      console.log(`  npm run vibe            # Check ship status`);
    });
  });
}

function downloadAndRunScript(scriptUrl, scriptArgs, onSuccess) {
  const tempDir = os.tmpdir();
  const scriptPath = path.join(tempDir, `vibeship-script-${Date.now()}.sh`);

  // Download script
  https.get(scriptUrl, (response) => {
    if (response.statusCode !== 200) {
      console.error(`${colors.red}❌ Failed to download script: HTTP ${response.statusCode}${colors.reset}`);
      
      // Check if it's a 404 and give specific message for init
      if (response.statusCode === 404) {
        console.log(`${colors.yellow}💡 Script not found. Please ensure the repository is up to date.${colors.reset}`);
        console.log(`${colors.yellow}💡 Check: https://github.com/bestbrian/vibeship${colors.reset}`);
      }
      
      process.exit(1);
    }

    const fileStream = fs.createWriteStream(scriptPath);
    response.pipe(fileStream);

    fileStream.on('finish', () => {
      fileStream.close();
      
      // Make script executable
      fs.chmodSync(scriptPath, '755');
      
      // Run the script
      console.log(`${colors.green}📦 Downloaded script, running setup...${colors.reset}`);
      
      const child = spawn('bash', [scriptPath, ...scriptArgs], {
        stdio: 'inherit',
        cwd: process.cwd()
      });

      child.on('close', (code) => {
        // Clean up temp file
        try {
          fs.unlinkSync(scriptPath);
        } catch (e) {
          // Ignore cleanup errors
        }
        
        if (code === 0) {
          onSuccess();
        } else {
          console.error(`${colors.red}❌ Setup failed with code ${code}${colors.reset}`);
          process.exit(code);
        }
      });

      child.on('error', (error) => {
        console.error(`${colors.red}❌ Failed to run script: ${error.message}${colors.reset}`);
        try {
          fs.unlinkSync(scriptPath);
        } catch (e) {
          // Ignore cleanup errors
        }
        process.exit(1);
      });
    });

  }).on('error', (error) => {
    console.error(`${colors.red}❌ Failed to download script: ${error.message}${colors.reset}`);
    console.log(`${colors.yellow}💡 Check your internet connection and try again${colors.reset}`);
    process.exit(1);
  });
}