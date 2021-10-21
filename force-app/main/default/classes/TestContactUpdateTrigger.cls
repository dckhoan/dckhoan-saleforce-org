@isTest
private class TestContactUpdateTrigger {
    @isTest static void TestUpdateInvactiveContact() {
        Account account = new Account(Name='Test Account', Total_Contacts__c = 0);
        insert account;
        
        Contact contact = new Contact(LastName='Test Contact', AccountId=account.Id);
        insert contact;
        
        contact.Active__c = false;
        update contact ;
       
        account = [SELECT Total_Contacts__c FROM Account WHERE Id = :account.Id];
        
        System.assertEquals(0, account.Total_Contacts__c);
    }
    
    @isTest static void TestUpdateActiveContact() {
        Account account = new Account(Name='Test Account', Total_Contacts__c = 0);
        insert account;
        
        Contact contact = new Contact(LastName='Test Contact', AccountId=account.Id);
        insert contact;
        
        contact.Active__c = true;
        update contact ;
       
        account = [SELECT Total_Contacts__c FROM Account WHERE Id = :account.Id];
        
        System.assertEquals(1, account.Total_Contacts__c);
    }
}