function Get-Metafolder($path='.')
{
	$root =  Find-RepositoryTreeRoot $path
	return join-path $root $RepositoryTreeMetaFolder
}

function Get-RepositoryFile($path)
{
	return join-path (Get-Metafolder($path)) $RespositoriesFileName
}

function Get-SourceFile($path)
{
	return (join-path (Get-MetaFolder $path) $SourceFileName)
}

function Get-RepositoryTreeSource($path = ".")
{
	$sourceFilePath = Get-SourceFile $path
	if (Test-Path $sourceFilePath){
		return Get-Content ($sourceFilePath)
	}
	return $null
}

function  Get-BranchSetFolder($path = '.')
{
	return join-path (Get-Metafolder $path) $BranchSetRelativeFolder
}

function  Get-BranchSetFile($path = '.',$Name)
{
	return join-path (Get-BranchSetFolder $path) ($name)
}


function  Get-RevisionSetFolder($path = '.')
{
	return join-path (Get-Metafolder $path) $RevisionSetRelativeFolder
}

function  Get-ParametersFolder($path = '.')
{
	return join-path (Get-Metafolder $path) 'Parameters'
}

function  Get-RevisionSetFile($path = '.',$Name)
{
	return join-path (Get-RevisionSetFolder $path) ($name)
}


