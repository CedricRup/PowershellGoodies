function Get-GitTree{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.'
	)
	
	begin{
		$source = Get-RepositoryTreeSource -path $path
	}
	
	process{
		get-Repositories -Path $path 
	}
}