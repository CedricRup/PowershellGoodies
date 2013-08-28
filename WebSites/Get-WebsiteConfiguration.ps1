function Get-WebSiteConfiguration{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.'
	)
	
	process{
		$lines = import-csv $path
		foreach($line in $lines){
			$physicalPath = (get-item $line.Path).FullName
			if ($line.Type -eq 'Front')
			{
				$hostHeader = "www-$($line.Environment).$($line.Domain)"
			}
			else
			{
				$hostHeader = "ws-$($line.Name -replace 'Rest-','')-$($line.Environment).$($line.Domain)"
			}
			$line | add-member -MemberType NoteProperty -Name PhysicalPath -Value $physicalPath
			$line | add-member -MemberType NoteProperty -Name HostHeader -Value $hostHeader
			$line
		}
	}
}