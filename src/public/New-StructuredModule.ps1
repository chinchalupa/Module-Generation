function New-StructuredModule {
    param (
        [Parameter(Mandatory)]
        [string]
        $SourcePath,

        [Parameter()]
        [string]
        $OutputPath = '.',

        [Parameter(Mandatory)]
        [string]
        $ModuleName,

        [Parameter()]
        [switch]
        $Force
    )
    New-ModuleFromPath -SourcePath $SourcePath -ModuleName $ModuleName -Force:$Force
    New-ModuleManifestFromPath -SourcePath $SourcePath -ManifestPath "$OutputPath\$moduleName.psd1" -ModuleName $ModuleName
}