#create a txt file with all mailboxes you need to add/remove permissions for on separate lines
#change [<FD>] (line 10) to the file directory for that .txt, but keep 
#change [<365adm>] (line 6) to your 365 admin email address
#works for adding or removing permissions, just change "Add-" to "Remove-" as needed
#comment out or delete mailboxpermission or recipientpermission line if only one is needed

Connect-ExchangeOnline -UserPrincipalName [<>]

$SharedMB = Read-Host -Prompt 'Please input the email address for the mailbox you are granting/revoking access to'

ForEach ($Line in Get-Content "[<FD>]")
{
    Add-MailboxPermission -Identity $SharedMB -User $Line -AccessRights FullAccess
    Add-RecipientPermission -Identity $SharedMB -Trustee $Line -AccessRights FullAccess
}