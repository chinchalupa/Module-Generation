<#
.SYNOPSIS
    Generates a module manifest from a common path structure.
#>
function New-ModuleManifestFromPath {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $SourcePath,

        [Parameter(Mandatory)]
        [string]
        $ManifestPath,

        [Parameter(Mandatory)]
        [string]
        $ModuleName
    )
    $moduleManifest = @{
        Path = $ManifestPath
        RootModule = "$ModuleName.psm1"
        FunctionsToExport = (Get-ChildItem -Path $SourcePath\public -Exclude "*.Tests.*" -Recurse -File).BaseName
    }

    New-ModuleManifest @moduleManifest
}
