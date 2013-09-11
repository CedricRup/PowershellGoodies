function Get-Parameter{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 2
			)]
		$Path = '.',
		[Parameter(Position = 1)]
		[string]$Name,
		$defaultValue
	)
	
	process{
		$filePath =  Get-ParameterFile -name $name -Path $path;
		if(Test-path $filePath){
			$value = get-content -path $filePath;
			return $value;
		}
		return $defaultValue
	}
}

function Get-ParameterFile{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 2
			)]
		$Path = '.',
		[Parameter(Position = 1)]
		[string]$Name
	)
	
	return join-path (Get-ParametersFolder $path) $name
}