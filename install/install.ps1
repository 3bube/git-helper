# Define the source and destination
$source = ".\dist\git-helper.bat"
$destination = "C:\ProgramData\GitHelper"  # Updated path

# Create the destination directory if it doesn't exist
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination
}

# Copy the Batch file to the destination
Copy-Item -Path $source -Destination "$destination\git-helper.bat" -Force

# Add the destination to the PATH environment variable (User level)
$path = [Environment]::GetEnvironmentVariable("PATH", [EnvironmentVariableTarget]::User)
if ($path -notlike "*$destination*") {
    [Environment]::SetEnvironmentVariable("PATH", "$path;$destination", [EnvironmentVariableTarget]::User)
    Write-Host "Added $destination to PATH"
}

# Set an alias for git-helper in PowerShell
Set-Alias -Name git-helper -Value "$destination\git-helper.bat"

Write-Host "Git Helper installed successfully! You can now use 'git-helper' globally in CMD and PowerShell."
