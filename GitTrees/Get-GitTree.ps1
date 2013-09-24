function Get-GitTree{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.'
	)
	
	process{
		get-Repositories -Path $path | % {
			$_ | add-member -MemberType NoteProperty -Name GitPath -Value ($_.FullPath + '\.git')
			$_
		}		
	}
}