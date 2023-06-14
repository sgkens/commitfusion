<#
    * ==> DESCRIPTION <==
       Defines the [gmo] class base object template
    &-> @param [string]
            $name: #* Name of the runspace pool
    &-> @param [int]
            $minRunspaces: #* Minimum number of runspaces
    &-> @param [int]
            $maxRunspaces: #*  Maximum number of runspaces
    !-> @return: RunspacePool 
            [RunspacePool]#>
#>
class gmo {
    [PSObject] $feature
    [PSObject] $fix
    [PSObject] $docs
    [PSObject] $chore
    [PSObject] $refactor
    [PSObject] $build
    [PSObject] $ci
    [PSObject] $perf
    [PSObject] $test
    [PSObject] $style
    [PSObject] $revert
    [PSObject] $deps
    [PSObject] $config
    [PSObject] $merge
    [PSObject] $deploy
    [PSObject] $release
    [PSObject] $security
    [PSObject] $other
    [PSObject] $misc
    [PSObject]$jsonData
    gmo() {
        # CONSTRUCTOR
    }
}
    
