Class LogAnalyticsLoggingInfo{
    [PowerFormResourceDefinition]$LogAnalyticsDefinition
    [string]$WorkspaceId
}
Class EventHubLoggingInfo{
    [PowerFormResourceDefinition]$EventHubDefinition
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
