function Get-SVNTree{
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
		get-Repositories -Path $path | % {
			$SVNTrunk = $_.Source + '/trunk'
			$_ | add-Member -MemberType NoteProperty -Name SVNPath -Value $_.Source
			$_ | add-Member -MemberType NoteProperty -Name SVNTrunk -Value $SVNTrunk
			$_
		}
	}
}