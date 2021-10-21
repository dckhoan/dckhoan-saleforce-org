public class SearchAccountsAndContactsController {
    public class RecordResult {
        public string Name { get; set; }
        public string Type { get; set; }
        public string Id { get; set; }
    }
    
    static final string ACCOUNT_TYPE = 'Account';
    static final string CONTACT_TYPE = 'Contact';
    
    public SearchAccountsAndContactsController() {
        searchText = '';
        records = new List<RecordResult>();
    }
    
    string searchText;
    List<RecordResult> records;
    
    public string getSearchText() {
        return searchText;
    }
    
    public void setSearchText(string text) {
        searchText = text;
    }
    
    public List<RecordResult> getRecords() {
        return records;
    }
    
    public Integer getRecordsCount() {
        return records.size();
    }
    
    public void search() {
        records.clear();
        
        if (string.isEmpty(searchText))
        {
            return;
        }
        
        for(Account a: [SELECT Name FROM Account WHERE Name LIKE :searchText + '%']) {
            RecordResult record = new RecordResult();
            record.Name = a.Name;
            record.Type = ACCOUNT_TYPE;
            record.Id = a.Id;
            records.add(record);
        }
        
        for(Contact c: [SELECT Name FROM Contact WHERE Name LIKE :searchText + '%']) {
            RecordResult record = new RecordResult();
            record.Name = c.Name;
            record.Type = CONTACT_TYPE;
            record.Id = c.Id;
            records.add(record);
        }
    }
}