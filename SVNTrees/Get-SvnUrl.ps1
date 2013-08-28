function Get-SVNUrl
{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$RootUrl,
		$RelativePath,
		[string]$Branch
	)
	
	if($branch)
	{
		$toJoin = ($RootUrl,$RelativePath,'branches',$Branch)
	}
	else
	{
		$toJoin = ($RootUrl,$RelativePath,'trunk')
	}
	return $toJoin -join '/'
}