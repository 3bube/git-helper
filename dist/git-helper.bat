@echo off

REM Check if a commit message is provided
IF "%~1"=="" (
    echo Error: No commit message provided.
    echo Usage: git-helper "Your commit message" [branch-name]
    exit /b 1
)

REM Set the branch name
SET BRANCH_NAME=%2
IF "%BRANCH_NAME%"=="" SET BRANCH_NAME=main

REM Run Git commands
git add .
git commit -m "%~1"
git push origin %BRANCH_NAME%
IF ERRORLEVEL 1 (
    echo Error: Failed to push to the branch %BRANCH_NAME%.
    exit /b 1
)

echo Changes pushed successfully!
