function Get-Parameter{
	param(
		[Parameter(
			ValueFromPipeline = $true,
			ValueFromPipelineByPropertyName = $true,
			Position = 1
			)]
		$Path = '.',
		[string]$Name,
		$defaultValue
	)
	
	process{
		$filePath =  Get-ParameterFile $path $name;
		if(Test-path $filePath){
			$value = get-content -path $filePath;
			return $value;
		}
		return $defaultValue
	}
}