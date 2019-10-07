$token = [System.Text.Encoding]::UTF8.GetBytes("7f45f03131016687b9095434d0c4af42fdf660f6" + ":")
$base64 = [System.Convert]::ToBase64String($token)
 
$basicAuth = [string]::Format("Basic {0}", $base64)
$headers = @{ Authorization = $basicAuth }
$result = Invoke-RestMethod -Method Get -Uri http://sonarqube:9000/api/qualitygates/project_status?projectKey=anc-web-api -Headers $headers
$result | ConvertTo-Json | Write-Host
 
if ($result.projectStatus.status -eq "OK") {
    Write-Host "Quality Gate Succeeded"
}   else    {
    throw "Quality gate failed"
}