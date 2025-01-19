FROM mcr.microsoft.com/powershell:lts-alpine-3.14
WORKDIR /app
COPY Fibonacci.ps1 .
COPY run-fibonacci.ps1 .
CMD ["pwsh", "-File", "run-fibonacci.ps1"]
