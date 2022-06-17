# Input bindings are passed in via param block.
param($Timer)

## remember to give msi on the function
## remember to give msi permissions on the sub
# test change 2

Write-Host ("Starting function to power down event hub namespaces...")

$scalemin = 1
$namespaces = Get-AzEventHubNamespace

foreach ($namespace in $namespaces)
{
$name = $namespace.Name
$resourceGroup = $namespace.ResourceGroup
$location = $namespace.Location
$scaletag = $namespace.Tags['ScaleMin']

Write-Host ("Name: $name")
Write-Host ("Resource Group: $resourceGroup")
Write-Host ("Location: $location")
Write-Host ("ScaleMin: $scaletag")

    if(!$scaletag)
    {
        Write-Host("Adding ScaleMin tag of $scalemin to namespace $name...")
        Update-AzTag -ResourceId $namespace.Id `
        -Tag @{ScaleMin=$scalemin;}
        Write-Host("Added ScaleMin tag of $scalemin to namespace $name.")
        $scaletag = $scalemin
    }

    Write-Host("Scaling namespace $name to $scalemin throughput units...")
    Set-AzEventHubNamespace -Name $name `
    -ResourceGroupName $resourceGroup `
    -Location $location `
    -SkuCapacity $scaletag
    Write-Host("Scaled namespace $name to $scalemin throughput units.")
}

Write-Host ("Ended function to power down event hub namespaces.")