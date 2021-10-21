@isTest
private class TestSearchAccountsAndContactsController {
    @isTest static void TestSearchEmptyString() {
        SearchAccountsAndContactsController controller = new SearchAccountsAndContactsController();
        controller.setSearchText('');
        controller.search();
        
        System.assertEquals(0, controller.getRecordsCount());
    }
    
    @isTest static void TestSearchHasNoResults() {
        SearchAccountsAndContactsController controller = new SearchAccountsAndContactsController();
        controller.setSearchText('Test');
        controller.search();
        
        System.assertEquals(0, controller.getRecordsCount());
        System.assertEquals('Test', controller.getSearchText());
    }
    
    @isTest static void TestSearchHasResults() {
        Account account = new Account(Name='Test Account');
        insert account;
        
        Contact contact = new Contact(LastName='Test Contact');
        insert contact;
        
        SearchAccountsAndContactsController controller = new SearchAccountsAndContactsController();
        controller.setSearchText('Test');
        controller.search();
        
        System.assertEquals(2, controller.getRecordsCount());
        System.assertEquals('Account', controller.getRecords()[0].Type);
        System.assertEquals('Contact', controller.getRecords()[1].Type);
    }
}