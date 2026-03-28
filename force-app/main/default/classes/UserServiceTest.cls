@isTest
private class UserServiceTest {
    @isTest static  void testGetCallout() {
       
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetUserResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        
        Test.setMock(HttpCalloutMock.class, new UserServiceMock());
       
        HttpResponse result = UserService.makeGetCallout();
        
        Assert.areNotEqual(null,result, 'The callout returned a null response.');
       
        Assert.areEqual(200,result.getStatusCode(), 'The status code is not 200.');
        
        Assert.areEqual('application/json;charset=UTF-8',
          result.getHeader('Content-Type'),
          'The content type value is not expected.');
        
        Map<String, Object> results = (Map<String, Object>)
            JSON.deserializeUntyped(result.getBody());
        List<Object> users = (List<Object>) results.get('users');
        Assert.areEqual(3, users.size(), 'The array should only contain 3 items.');
    }
}
