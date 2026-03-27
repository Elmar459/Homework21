public class UserService{

    public class User{
        public String firstname;
        public String lastname;
        public String phone;
    }

    public class UsersResponse {
        public List<User> users;
    }

    public static HttpResponse makeGetCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://super-api.com/users/');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {

                        Map<String, Object> results =
                (Map<String, Object>) JSON.deserializeUntyped(response.getBody());

            
            List<Object> usersRaw = (List<Object>) results.get('users');

            System.debug('Untyped parsing');
            for (Object u : usersRaw) {
                System.debug(u);
            }

            UsersResponse typedResult =
                (UsersResponse) JSON.deserialize(response.getBody(), UsersResponse.class);

            System.debug('Typed parsing');

            for (User u : typedResult.users) {
                System.debug(u.firstname + ' ' + u.lastname);
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
        request.setBody('{"name":"Thomas Conlin"}');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' 
            + response.getStatusCode() + ' ' 
            + response.getStatus());
        } else {
            System.debug(response.getBody());
        }

        return response;
    }

}