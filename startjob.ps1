asnp VeeamPSSnapin
$remote=Get-VBRJob  -Name "HQ_Remote" | where {$_.GetLastState() -ne "stopped"}
$local1=Get-VBRJob  -Name "HQ_Local_1" | where {$_.GetLastState() -ne "stopped"}
$local2=Get-VBRJob  -Name "HQ_Local_2" | where {$_.GetLastState() -ne "stopped"}

if ($remote -Or $local1 -Or $local2){
    write-host "Backup Job detected, terminating"
}
else{
    write-host "Local backup will start...."
    Get-VBRJob -Name "HQ_local_1" | Start-VBRJob -StartChainedJobs -RunAsync
}
