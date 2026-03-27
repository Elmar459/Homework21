public class UserService{

    public static HttpResponse makeGetCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://super-api.com/users/');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if (response.getStatusCode()==200) {
            Map<String, Object> results =
            (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

        List<Object> users = (List<Object>) results.get('Users');
            System.debug('Received the following users:');

        for (Object user : users) {
            System.debug(user);
        }
        }        
        return response;
    }
    
    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://super-api.com/users/');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name:" "Thomas Conlin"}');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() !=201) {
            System.debug('The status code returned was not expected: ' 
            + response.getStatusCode() + ' ' 
            + response.getStatus());
        }else {
            System.debug(response.getBody());
        }
        return response;
    }

}