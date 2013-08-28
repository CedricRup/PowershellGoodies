function New-RepositoryTree($path = ".",$svnBaseUrl)
{
   $root = (get-item $path).FullName
   $rootDirectory = join-path $root $RepositoryTreeMetaFolder
   if (-not (Test-Path $rootDirectory))
   {
      mkdir $rootDirectory | out-null
   }
   $svnBaseUrl | Set-content -path (Get-SourceFile($root))
   $root
}