function Canonicalize-Path($path)
{
    [System.IO.Path]::GetFullPath($path)
}