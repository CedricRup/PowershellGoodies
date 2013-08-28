function Checkout-SVNTree($path='.')
{
	get-SVNTree -path $path | %{ svn checkout $($_.SvnTrunk) $($_.FullPath) } 
}