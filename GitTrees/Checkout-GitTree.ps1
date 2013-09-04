function Checkout-GitTree($path='.')
{
	get-GitTree -path $path | %{ git clone $($_.Source) $($_.FullPath) } 
}