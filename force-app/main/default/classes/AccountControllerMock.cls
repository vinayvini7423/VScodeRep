@isTest
global class AccountControllerMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
         HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"access_token":"SESSION_ID_REMOVED","instance_url":"https://brilliocompany-dev-ed.my.salesforce.com","id":"https://login.salesforce.com/id/00D7F000005UQD6UAO/0057F000002skqdQAA","token_type":"Bearer","issued_at":"1525426392125","signature":"zC6RHtqR3vEJYDA38ckiDWILZyVKx4jSgVKYb+QwH/E="}');
        response.setStatusCode(200);
        return response;
    }
}