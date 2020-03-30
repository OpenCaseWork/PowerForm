Class LogAnalyticsLoggingInfo{
    [PfResource]$LogAnalyticsDefinition
    [string]$WorkspaceId
}
Class EventHubLoggingInfo{
    [PfResource]$EventHubDefinition
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
