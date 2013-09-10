function Get-SVNStatus
{
	[CmdletBinding()]
    param(
        [Parameter(Position=1,
             ValueFromPipeline =$true,
			 ValueFromPipelineByPropertyName  =$true
		)]
		[Alias("FullPath","Path")]
		[string[]]$RepositoryPath = '.'
    )
	
    process{ 
        svn status $RepositoryPath
		
    }
}