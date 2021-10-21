global class UpdateContactResponse {
    global Id id;
    global boolean success;
    global List<String> errors;
    
    global static UpdateContactResponse newInstance(Id id, boolean success, List<String> errors) {
        UpdateContactResponse response = new UpdateContactResponse();
        response.id = id;
        response.success = success;
        response.errors = errors;
        
        return response;
    }
}