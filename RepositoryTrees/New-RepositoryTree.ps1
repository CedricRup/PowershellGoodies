function New-RepositoryTree($path = ".")
{
   $root = (get-item $path).FullName
   $rootDirectory = join-path $root $RepositoryTreeMetaFolder
   if (-not (Test-Path $rootDirectory))
   {
      mkdir $rootDirectory | out-null
   }
   $null | Set-content -path (Get-SourceFile($root))
   $root
}