@echo off

REM Check if no arguments are passed
IF "%~1"=="" (
    echo =====================================
    echo Git Helper - Usage Instructions
    echo =====================================
    echo Usage:
    echo   git-helper "Your commit message" [branch-name]
    echo 
    echo Description:
    echo   Automates the process of staging, committing, 
    echo   and pushing changes to a Git repository.
    echo   Also allows pulling the latest changes.
    echo
    echo Parameters:
    echo   "Your commit message"  Required. The message for your commit.
    echo   [branch-name]          Optional. Defaults to 'main' if not provided.
    echo
    echo Examples:
    echo   git-helper "Initial commit"
    echo   git-helper "Fixed issue" develop
    echo   git-helper pull develop
    echo =====================================
    exit /b 0
)

REM Handle the 'pull' argument
IF /I "%~1"=="pull" (
    REM If branch name is provided, use it; otherwise, default to 'main'
    SET BRANCH_NAME=%2
    IF "%BRANCH_NAME%"=="" SET BRANCH_NAME=main

    REM Pull the latest changes
    git pull origin %BRANCH_NAME%
    IF ERRORLEVEL 1 (
        echo Error: Failed to pull from the branch %BRANCH_NAME%.
        exit /b 1
    )

    echo Changes pulled successfully from %BRANCH_NAME%.
    exit /b 0
)

REM Set the branch name for commit and push
SET BRANCH_NAME=%2
IF "%BRANCH_NAME%"=="" SET BRANCH_NAME=main

REM Run Git commands for commit and push
git add .
git commit -m "%~1"
git push origin %BRANCH_NAME%
IF ERRORLEVEL 1 (
    echo Error: Failed to push to the branch %BRANCH_NAME%.
    exit /b 1
)

echo Changes pushed successfully to %BRANCH_NAME%.
exit /b 0
