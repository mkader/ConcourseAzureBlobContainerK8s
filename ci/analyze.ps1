try {
	Write-Output "INFO: ============== START dotnet sonarscanner"
	Invoke-Expression "dotnet-sonarscanner begin /k:'anc-web-api' /d:sonar.host.url='http://localhost:9000' /d:sonar.login='88b2f1a53409ce7cd4bb0f7acf6c95113517853c'"
	Write-Output "INFO: ============== END dotnet sonarscanner"

	Write-Output "INFO: ============== START dotnet build"
	Invoke-Expression "dotnet build"
	Write-Output "INFO: ============== END dotnet build"

	if ($LASTEXITCODE -ne 0) {
		Write-Output "Failed: Build Failure"
		exit $LASTEXITCODE
	}

	Write-Output "INFO: ============== START dotnet sonarscanner end | Tee-Object -Variable ScannerOutput"
	Invoke-Expression "dotnet sonarscanner end"
	Write-Output "INFO: ============== END dotnet sonarscanner end | Tee-Object -Variable ScannerOutput"
}    
catch {
    Write-Output "ERROR: We trapped an exception, failing the step"
    $error[0]
    Exit 1
}

exit $LASTEXITCODE