@echo off

REM Display help menu if no arguments are passed
IF "%~1"=="" (
    echo =====================================
    echo Git Helper - Usage Instructions
    echo =====================================
    echo Usage:
    echo   git-helper commit "Your commit message" [branch-name]
    echo   git-helper pull [branch-name]
    echo
    echo Description:
    echo   Automates common Git tasks like staging, committing, 
    echo   pushing, and pulling changes from a Git repository.
    echo
    echo Commands:
    echo   commit              Stages, commits, and pushes changes.
    echo   pull                Pulls the latest changes from the branch.
    echo
    echo Parameters for 'commit':
    echo   "Your commit message"  Required. The message for your commit.
    echo   [branch-name]          Optional. Defaults to 'main' if not provided.
    echo
    echo Parameters for 'pull':
    echo   [branch-name]          Optional. Defaults to 'main' if not provided.
    echo =====================================
    exit /b 0
)

REM Determine the action (commit or pull)
SET ACTION=%1

REM Default branch name
SET BRANCH_NAME=%2
IF "%BRANCH_NAME%"=="" SET BRANCH_NAME=main

REM Handle 'commit' action
IF /I "%ACTION%"=="commit" (
    REM Check if a commit message is provided
    IF "%~2"=="" (
        echo Error: No commit message provided.
        echo Usage: git-helper commit "Your commit message" [branch-name]
        exit /b 1
    )
    SET "COMMIT_MESSAGE=%~2"

    REM Run Git commands
    git add .
    git commit -m "%COMMIT_MESSAGE%"
    git push origin %BRANCH_NAME%
    IF ERRORLEVEL 1 (
        echo Error: Failed to push to the branch %BRANCH_NAME%.
        exit /b 1
    )
    echo Changes pushed successfully!
    exit /b 0
)

REM Handle 'pull' action
IF /I "%ACTION%"=="pull" (
    git pull origin %BRANCH_NAME%
    IF ERRORLEVEL 1 (
        echo Error: Failed to pull changes from the branch %BRANCH_NAME%.
        exit /b 1
    )
    echo Changes pulled successfully from %BRANCH_NAME%!
    exit /b 0
)

REM Invalid command
echo Error: Unknown command '%ACTION%'.
echo Use 'git-helper' without arguments to see usage instructions.
exit /b 1
