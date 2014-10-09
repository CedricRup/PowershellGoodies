param(
	$RootPath = '.',
	$ElasticServer = (throw "Elastic Search Server not specified")
)

$jsonFiles = get-childitem -Path $RootPath -Include *.json -Recurse

foreach($jsonFile in $jsonFiles)
{
	[string]$content=Get-Content -Path $jsonFile.FullName
	$requests = @(ConvertFrom-Json $content)
	foreach($request in $request){
		$body = $request.Body | ConvertTo-Json -Depth 10
		$uri = $ElasticServer + $request.RelativeUri
		Invoke-WebRequest -Uri $uri -Body $body -Method $request.Method
	}
}


