function Update-SVNTree
{
	[CmdletBinding()]
    param(
        [Parameter(Position=1,
             ValueFromPipeline =$true,
			 ValueFromPipelineByPropertyName  =$true
		)]
		[Alias("FullPath","Path")]
		[string[]]$RepositoryPath = '.',
		[Switch]$PostponeConficts,
		[Switch]$Visual
		
    )
	begin{
		if ($PostponeConficts){
			$svnargs = @("--accept","p");
		}
		elseif ($Visual){
			$svnargs = @("--accept","l");
		}
	}
	
    process{ 
        Get-SVNTree -path $RepositoryPath | % {
			svn update $_.FullPath $svnargs
			$result = svn status $_.FullPath -q | % {$_.StartsWith('C')}
			if($result -contains $true){
				Write-Host -ForegroundColor Red "Some conflicts remain"
			}
		}
    }
}