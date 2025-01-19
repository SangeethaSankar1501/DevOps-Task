function Copy-Prerequisites {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ComputerName,
        [Parameter(Mandatory = $true)]
        [string[]]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Destination
    )
    
    foreach ($file in $Path) {
        
        $escapedFile = $file -replace '\\', '/'
        Write-Host "Copying $escapedFile to ${ComputerName}:${Destination}"
        scp -r $escapedFile "${ComputerName}:${Destination}"
    }
}

function Build-DockerImage {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ComputerName,
        [Parameter(Mandatory = $true)]
        [string]$Dockerfile,
        [Parameter(Mandatory = $true)]
        [string]$Tag,
        [Parameter(Mandatory = $true)]
        [string]$Context
    )
    
    $buildCommand = "docker build -f $Dockerfile -t $Tag $Context"
    Write-Host "Building Docker image: $Tag on $ComputerName"
    ssh $ComputerName $buildCommand
}

function Run-DockerContainer {
    param (
        [Parameter(Mandatory = $true)]
        [string]$ComputerName,
        [Parameter(Mandatory = $true)]
        [string]$ImageName,
        [string[]]$DockerParams
    )
   
    $dockerParamsString = if ($DockerParams) { $DockerParams -join ' ' } else { "" }
    $runCommand = "docker run $dockerParamsString $ImageName"
    Write-Host "Running Docker container: $ImageName on $ComputerName"
    ssh $ComputerName $runCommand
}
