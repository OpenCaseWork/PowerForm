Class LogAnalyticsLoggingInfo{
    [PfDefinition]$LogAnalyticsDefinition
    [string]$WorkspaceId
}
Class EventHubLoggingInfo{
    [PfDefinition]$EventHubDefinition
    [string]$EventHubName
    [string]$AuthorizationRuleId
    [bool]$EnableRetention
    [int]$RetentionInDays
}
Class AzLogging{
    [LogAnalyticsLoggingInfo]$LogAnalyticsInfo
    [EventHubLoggingInfo]$EventHubInfo
    [bool]$EnableLoggins
}
