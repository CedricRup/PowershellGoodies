$definition = '[DllImport("shlwapi.dll")]
public static extern bool PathRelativePathTo(
        StringBuilder pszPath,
        string pszFrom,
        FileAttributes dwAttrFrom,
        string pszTo,
        FileAttributes dwAttrTo);
'
$shlwapi = Add-Type -Name ShlwApi -MemberDefinition $definition -usingNamespace "System.Text", "System.IO" -PassThru

function Resolve-RelativePath($from, $to)
{
    $builder = New-Object System.Text.StringBuilder 260
    if ($shlwapi::PathRelativePathTo($builder, $from, [System.IO.FileAttributes]::Directory, $to, [System.IO.FileAttributes]::Directory))
    {
        return $builder.ToString()
    }
        
    return $null
}