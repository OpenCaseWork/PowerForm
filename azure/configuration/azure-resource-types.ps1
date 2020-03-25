Class AzureResourceTypes{
    static [AzureResourceType]$KeyVault = @{
        Name = "Key Vault"
        Abbreviation = "KV"
        DiagnosticCategoriesToLog = "AuditEvent"
        MetricCategoriesToLog = "AllMetrics"
        ClassPrefix = "KeyVault"
    }
    static [AzureResourceType]$LogAnalytics = @{
        Name = "Log Analytics"
        Abbreviation = "LA"
        DiagnosticCategoriesToLog = ""
        MetricCategoriesToLog = ""
        ClassPrefix = "LogAnalytics"
    }
}