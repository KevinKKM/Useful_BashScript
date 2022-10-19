$fullpaths = Get-ChildItem -Path E:\test_search -Filter *.dll -Recurse -ErrorAction SilentlyContinue -Force | Select-Object FullName
foreach ($fullpath in $fullpaths){
$ValidStatus = [string](Get-AuthenticodeSignature -FilePath $fullpath.FullName | Select-Object -ExpandProperty Status)
#echo $ValidStatus
if($ValidStatus -eq "Valid"){
$Signer = [string](Get-AuthenticodeSignature -FilePath $fullpath.FullName | Select-Object -ExpandProperty SignerCertificate | Select-Object Subject).Subject.Split(" ")[0].Split("=")[1]
#$Signature = (Get-AuthenticodeSignature -FilePath $fullpath.FullName | Select-Object -ExpandProperty SignerCertificate | Select-Object Thumbprint).Thumbprint
}else{
$Signer = "Not Signed"
}
$Hash = (Get-FileHash $fullpath.FullName | Select-Object -ExpandProperty Hash)

[PSCustomObject]@{
Signer = $Signer
File = $fullpath.FullName
Hash = $Hash
}
}