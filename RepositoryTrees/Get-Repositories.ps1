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
	        @(Import-CSV -path $repositories) | % {
				$relativePath = $_.RelativePath
				$FullPath = Canonicalize-path( join-path $root $relativePath)
				$_ | add-Member -MemberType NoteProperty -Name FullPath -Value $FullPath -PassThru
			}
		}
	}
}