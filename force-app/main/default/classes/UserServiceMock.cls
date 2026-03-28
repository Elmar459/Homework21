@isTest
global class UserServiceMock implements HttpCalloutMock {
    
        global HttpResponse respond(HttpRequest request) {   
            
            HttpResponse response = new HttpResponse();

            response.setHeader('Content-Type', 'application/json');
            response.setBody('{{"users":[{"firstname":"Elmar","lastname":"Sharifzade","phone":"+994559340091"}]}');
            response.setStatusCode(200);
            return response;
    }
}