@isTest
private class TestContactsRestResource {
    @isTest static void TestUpdateNonExistentContacts() {
        Contact contact = new Contact(LastName='Test Contact', Id='0035j000006EcDiAAK');
        
        List<Contact> contacts = new List<Contact>();
        contacts.add(contact);
        
        List<UpdateContactResponse> response = ContactsRestResource.updateContacts(contacts);
        System.assertEquals(false, response[0].success);
    }
    
    @isTest static void TestUpdateExistentContacts() {
        Contact contact = new Contact(LastName='Test Contact');
        insert contact;
        
        List<Contact> contacts = new List<Contact>();
        contacts.add(contact);
        
        List<UpdateContactResponse> response = ContactsRestResource.updateContacts(contacts);
        System.assertEquals(true, response[0].success);
    }
    
    @isTest static void TestUpdateErrorContacts() {
        Contact contact = new Contact(LastName='Test Contact');
        insert contact;
        
        contact.LastName = '';
        List<Contact> contacts = new List<Contact>();
        contacts.add(contact);
        
        List<UpdateContactResponse> response = ContactsRestResource.updateContacts(contacts);
        System.assertEquals(false, response[0].success);
    }
}