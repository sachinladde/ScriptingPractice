
function Get-NestedCustomObjectValue {
    param (
        [Parameter(Mandatory=$true)]
        [PSCustomObject]$obj,

        [Parameter(Mandatory=$true)]
        [string]$key
    )

    $keys = $key -split '/'
    $result = $obj
    foreach ($k in $keys) {
        if ($result.PSObject.Properties[$k]) {
            $result = $result.$k
        } else {
            $result = $null
            break
        }
    }
    return $result
}

# Example usage:
$object1 = [PSCustomObject]@{
    a = [PSCustomObject]@{
        b = [PSCustomObject]@{
            c = "d"
        }
    }
}

$value1 = Get-NestedCustomObjectValue -obj $object1 -key "a/b/c"
Write-Host $value1  # Output: "d"

$object2 = [PSCustomObject]@{
    x = [PSCustomObject]@{
        y = [PSCustomObject]@{
            z = "a"
        }
    }
}

$value2 = Get-NestedCustomObjectValue -obj $object2 -key "x/y/z"
Write-Host $value2  # Output: "a"
