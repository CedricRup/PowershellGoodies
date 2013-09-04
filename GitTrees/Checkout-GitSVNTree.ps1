function Checkout-GitSVNTree($path='.')
{
	get-GitTree -path $path | %{ git svn clone $($_.Source) $($_.FullPath) -stdlayout} 
}