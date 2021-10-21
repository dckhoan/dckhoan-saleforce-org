trigger ContactUpdateTrigger on Contact (after update) {
    List<Account> accounts = new List<Account>();
    for(Contact contact: [SELECT Id, Active__c, Account.Total_Contacts__c
                          FROM Contact 
                          WHERE Id IN :Trigger.New]) {
        if (contact.Active__c == true) {
            contact.Account.Total_Contacts__c += 1;
            accounts.add(contact.Account);
        }
    }
    
    update accounts;
}