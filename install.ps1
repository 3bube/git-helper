# Define the destination path (inside the user's home directory)
$destination = "$env:USERPROFILE\GitHelper"

# Create the destination directory
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination
}

# Copy the Batch file to the destination
Copy-Item -Path ".\git-helper.bat" -Destination "$destination\git-helper.bat" -Force

# Add the destination to the PATH environment variable for the current user
$existingPath = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::User)
if ($existingPath -notlike "*$destination*") {
    [Environment]::SetEnvironmentVariable("PATH", "$existingPath;$destination", [EnvironmentVariableTarget]::User)
}

Write-Host "Git Helper installed successfully!" -ForegroundColor Green
Write-Host "You can now use 'git-helper' from anywhere in your terminal."
