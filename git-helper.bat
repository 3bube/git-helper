@echo off

REM Check if a commit message is provided
IF "%~1"=="" (
    echo Error: No commit message provided.
    echo Usage: git-helper "Your commit message"
    exit /b 1
)

REM Run Git commands
git add .
git commit -m "%~1"
git push

echo Changes have been pushed successfully!
