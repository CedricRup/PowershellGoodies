function Get-Repositories{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.'
	)
	
	process{
		$root = Find-RepositoryTreeRoot $path;
		$repositories = Get-RepositoryFile($path)
		$source = Get-RepositoryTreeSource($path)
			
		if (Test-Path $repositories)
		{
	        @(Get-Content $repositories) | ? { $_.Trim().Length -ne 0} | % {
				$relativePath = $_
				$FullPath = Canonicalize-path( join-path $root $_)
				new-object -typeName PsObject -Property @{RelativePath=$relativePath;FullPath=$FullPath}
			}
		}
	}
}