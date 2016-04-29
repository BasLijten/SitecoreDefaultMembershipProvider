function XmlDocTransform($xml, $xdt)
{
    if (!$xml -or !(Test-Path -path $xml -PathType Leaf)) {
        throw "File not found. $xml";
    }
    if (!$xdt -or !(Test-Path -path $xdt -PathType Leaf)) {
        throw "File not found. $xdt";
    }
 
    $scriptPath = $pwd #(Get-Variable MyInvocation -Scope 1).Value.InvocationName | split-path -parent
    Add-Type -LiteralPath ".\Microsoft.Web.XmlTransform.dll"
 
    $xmldoc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument;
    $xmldoc.PreserveWhitespace = $true
    $xmldoc.Load($xml);
 
    $transf = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt);
    if ($transf.Apply($xmldoc) -eq $false)
    {
        throw "Transformation failed."
    }
    $xmldoc.Save($xml);
}
 
XmlDocTransform .\Web.config .\ChangeProvider.xdt

 
 
