function Checkout-RepositoryTree($path='.')
{
	get-repositories | %{ svn checkout $($_.SvnTrunk) $($_.FullPath) } 
}