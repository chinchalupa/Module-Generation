function New-ModuleFromPath {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $SourcePath,

        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        $ModuleName,

        [Parameter()]
        [switch]
        $Force
    )
    Get-ChildItem -Path $SourcePath -Exclude "*.Tests.*" -Recurse -File | Get-Content | Out-File -FilePath "$ModuleName.psm1" -Encoding utf8 -Force:$Force
}