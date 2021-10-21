@isTest
private class TestContactDeleteTrigger {
    @isTest static void TestDeleteInvactiveContact() {
        Account account = new Account(Name='Test Account', Total_Contacts__c = 1);
        insert account;
        
        Contact contact = new Contact(LastName='Test Contact', Active__c = false, AccountId=account.Id);
        insert contact;
        
        delete contact;
        account = [SELECT Total_Contacts__c FROM Account WHERE Id = :account.Id];
        
        System.assertEquals(1, account.Total_Contacts__c);
    }
    
    @isTest static void TestDeleteActiveContact() {
        Account account = new Account(Name='Test Account', Total_Contacts__c = 1);
        insert account;
        
        Contact contact = new Contact(LastName='Test Contact', Active__c = true, AccountId=account.Id);
        insert contact;
        
        delete contact ;
        account = [SELECT Total_Contacts__c FROM Account WHERE Id = :account.Id];
        
        System.assertEquals(0, account.Total_Contacts__c);
    }
}