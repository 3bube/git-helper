#!/usr/bin/env node

const { execSync } = require("child_process");

const commitMessage = process.argv[2];

if (!commitMessage) {
  console.error("Error: No commit message provided.");
  console.log('Usage: git-helper "Your commit message"');
  process.exit(1);
}

try {
  execSync("git add .", { stdio: "inherit" });
  execSync(`git commit -m "${commitMessage}"`, { stdio: "inherit" });
  execSync("git push", { stdio: "inherit" });
  console.log("Changes have been pushed successfully!");
} catch (error) {
  console.error("Error executing git commands:", error.message);
}
