function Update-RepositoryTree
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
    process { 
        Get-Repositories($RepositoryPath) | % {
			svn update $_.FullPath --accept 'p'
			$result = svn status $_.FullPath -q | % {$_.StartsWith('C')}
			if($result -contains $true){
				Write-Host "Some conflicts were found... Wanna solve it?"
			}
		}
    }
}