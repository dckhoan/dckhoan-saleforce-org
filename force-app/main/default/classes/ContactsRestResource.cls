@RestResource(urlMapping='/Contacts/*')
global with sharing class ContactsRestResource {
    
    @HttpPatch
    global static List<UpdateContactResponse> updateContacts(List<Contact> contacts) {
        Map<Id, Contact> updateContacts = new Map<Id, Contact>(contacts);
        
        List<Id> existingContactIds = new List<Id>();
        for(Contact c: [SELECT Id FROM Contact WHERE Id in :updateContacts.keySet()]) {
            existingContactIds.add(c.Id);
        }
        
        List<UpdateContactResponse> responses = new List<UpdateContactResponse>();
        for(Id updateContactId: updateContacts.keySet()) {
            if (!existingContactIds.contains(updateContactId))
            {
                List<string> errors = new List<string>();
                errors.add('Id does not exist in the system.');
                responses.add(UpdateContactResponse.newInstance(updateContactId, false, errors));
                
                updateContacts.Remove(updateContactId);
            }
        }
        
        Database.SaveResult[] results = Database.update(updateContacts.values(), false);
        
        for(Database.SaveResult result: results) {
            List<string> errors = new List<string>(); 
            for(Database.Error error : result.getErrors()) {
                errors.add('The following error has occurred. ' 
                           + error.getStatusCode() + ': ' + error.getMessage() 
                           + '. Fields that affected this error: ' + error.getFields());
            }
            
            responses.add(UpdateContactResponse.newInstance(result.getId(), result.isSuccess(), errors));
        }
        
        return responses;
    }
}