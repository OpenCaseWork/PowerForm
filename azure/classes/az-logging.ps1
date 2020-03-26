Class LogAnalyticsLoggingInfo{
    [PfResourceDefinition]$LogAnalyticsDefinition
    [string]$WorkspaceId
}
Class EventHubLoggingInfo{
    [PfResourceDefinition]$EventHubDefinition
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
