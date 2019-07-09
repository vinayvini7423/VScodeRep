public class NetSuitCallingMethod {
    Public void testNetSuit(){
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        String endpoint = 'https://rest.na1.netsuite.com/app/site/hosting/restlet.nl?script=1507&deploy=1';
        req.setEndpoint(endpoint);
        string custId;
        req.setMethod('POST');
        req.setTimeout(119990);
        
        oAuth1 oAuth = new oAuth1();
        
        Http http = new Http();
        String responseBody;
        req.setHeader('Content-Type','application/json');
        
        //Construct Authorization and Content header
        String header = oAuth.sign(req);
        req.setHeader('Authorization', header);
                                req.setBody('{"RequestType":"GET"}');
                                res = http.send(req);
        responseBody = res.getBody();
        System.debug('Response ==>'+responseBody);
system.debug('--header---'+res.getHeader('Authorization'));

    }
}