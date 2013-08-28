function Find-RepositoryTreeRoot ($path = ".")
{
  $folder = Get-Item $path
  while((!(Test-Path (Join-Path $folder.FullName $RepositoryTreeMetaFolder))) -and ($folder.Parent -ne $null)) {
   $folder = $folder.Parent
   }

   if (Test-Path (Join-Path $folder.FullName $RepositoryTreeMetaFolder))
   {
        return $folder.FullName
   }
   return $null
}