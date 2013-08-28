function Create-WebSite{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$WebSiteConfiguration,
		[Switch]$Force
	)
	
	process{
	
		$WebSiteConfiguration | new-WebSite -force:$force
		if ($WebSiteConfiguration.Type -eq 'Rest'){
			$header = "www-$($WebSiteConfiguration.Name -replace 'Rest-','')-$($WebSiteConfiguration.Environment).$($WebSiteConfiguration.Domain)"
			$WebSiteConfiguration | New-WebBinding -HostHeader $header -name $WebSiteConfiguration.Name
		}
	}
}