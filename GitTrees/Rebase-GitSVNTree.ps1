function Rebase-GitSVNTree
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
        Get-GitTree -path $RepositoryPath | % {
			git --git-dir="$($_.GitPath)" --work-tree="$($_.FullPath)" svn rebase $_.FullPath
		}
    }
}