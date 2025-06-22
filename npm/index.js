#!/usr/bin/env node

const https = require('https');
const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

// Get project name from command line args
const projectName = process.argv[2] || 'my-app';

// Colors for output
const colors = {
  blue: '\x1b[34m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  reset: '\x1b[0m'
};

console.log(`${colors.blue}🚢 Creating Vibeship project: ${projectName}${colors.reset}`);

// Download the script from GitHub
const scriptUrl = 'https://raw.githubusercontent.com/bestbrian/vibeship/main/create-vibeship.sh';
const tempDir = os.tmpdir();
const scriptPath = path.join(tempDir, 'create-vibeship.sh');

// Download script
https.get(scriptUrl, (response) => {
  if (response.statusCode !== 200) {
    console.error(`${colors.red}❌ Failed to download script: HTTP ${response.statusCode}${colors.reset}`);
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
    
    const child = spawn('bash', [scriptPath, projectName], {
      stdio: 'inherit',
      cwd: process.cwd()
    });

    child.on('close', (code) => {
      // Clean up temp file
      fs.unlinkSync(scriptPath);
      
      if (code === 0) {
        console.log(`${colors.green}✅ Project created successfully!${colors.reset}`);
        console.log(`${colors.yellow}Next steps:${colors.reset}`);
        console.log(`  cd ${projectName}`);
        console.log(`  cat QUICK_START.md  # Follow the 30-minute setup`);
      } else {
        console.error(`${colors.red}❌ Setup failed with code ${code}${colors.reset}`);
        process.exit(code);
      }
    });

    child.on('error', (error) => {
      console.error(`${colors.red}❌ Failed to run script: ${error.message}${colors.reset}`);
      fs.unlinkSync(scriptPath);
      process.exit(1);
    });
  });

}).on('error', (error) => {
  console.error(`${colors.red}❌ Failed to download script: ${error.message}${colors.reset}`);
  console.log(`${colors.yellow}💡 Fallback: Try the direct method:${colors.reset}`);
  console.log(`curl -s https://raw.githubusercontent.com/bestbrian/vibeship/main/create-vibeship.sh | bash -s ${projectName}`);
  process.exit(1);
});