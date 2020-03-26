#Todo: How do we allow overrides of configuration from deployment?
Class AzResourceTypes{
    static [AzResourceType]$KeyVault = @{
        Name = "Key Vault"
        Abbreviation = "KV"
        DiagnosticCategoriesToLog = "AuditEvent"
        MetricCategoriesToLog = "AllMetrics"
        ClassPrefix = "KeyVault"
    }
    static [AzResourceType]$LogAnalytics = @{
        Name = "Log Analytics"
        Abbreviation = "LA"
        DiagnosticCategoriesToLog = ""
        MetricCategoriesToLog = ""
        ClassPrefix = "LogAnalytics"
    }
}