function Build-VSSolutions{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.'
	)
	
	begin{
		$msbuild = get-item 'C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe'
	}
	
	process{
		(get-Repositories -Path $path).FullPath | % {get-childitem -path $_ -r -include *.sln} | % {& $msbuild $_.FullName}
	}
}
