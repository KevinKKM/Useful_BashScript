$StartDate = [datetime]"01/01/2014 00:00";
$EndDate = (Get-Date);
$DateDifferent = New-TimeSpan -Start $StartDate -End $EndDate;
echo $DateDifferent.Days