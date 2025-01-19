# Use PowerShell as the base image
FROM mcr.microsoft.com/powershell:lts-alpine-3.14
# Set working directory
WORKDIR /app
# Copy the PowerShell scripts into the container
COPY Fibonacci.ps1 .
COPY run-fibonacci.ps1 .
# Set the default entrypoint to the run-fibonacci script
CMD ["pwsh", "-File", "run-fibonacci.ps1"]
