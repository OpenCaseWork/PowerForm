Enum LockLevel {
    CanNotDelete = 0
    ReadOnly = 1
    None = 2
}
Class AzLock{
    [string]$Name
    [string]$Notes
    [LockLevel]$LockLevel
}