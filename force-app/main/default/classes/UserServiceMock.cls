@isTest
global class UserServiceMock implements HttpCalloutMock {
    
        global HttpResponse respond(HttpRequest request) {   
            
            HttpResponse response = new HttpResponse();

            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"users", ["Thomas Conlin", "Elmar Sharifzade", "Emin Huseynov"]}');
            response.setStatusCode(200);
            return response;
    }
}