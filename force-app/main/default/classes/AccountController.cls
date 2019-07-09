public with sharing class AccountController 
{
   // private ApexPages.StandardSetController standardController;

  //  public AccountController()
//{
       /// /this.standardController = standardController;
      //  System.debug(standardController.getFilterId());/
  //  }

    public void GetSelectedAccount()
    {       
        		
      		//List<Account> selectedAccounts = (List<Account>) standardController.getSelected(); 
        	List<Account> AccountList=[SELECT Type, Id,Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, Phone, Fax, AccountNumber, Website, Sic, Industry, AnnualRevenue, NumberOfEmployees, TickerSymbol, Ownership, Description, Active__c, NumberofLocations__c, UpsellOpportunity__c, SLASerialNumber__c, SLAExpirationDate__c, Match_Billing_Address__c FROM Account  limit 1];
          	List<Account> selectedAccountsDetails = new List<Account>();
      			
                String Id='Id';
        		String externalId='Reference_Id__c';
               	String data1=JSON.serialize(AccountList);
                data1=data1.replaceAll(Id, externalId);
       			data1='{"records" :'+data1+'}';
               	System.debug('id part-----'+data1+'-----------object output--------');
                ToSend(data1);
     
        //return null;        
    }
  public  void ToSend(String data){ 
      				//client side login details
                    String clientId = '3MVG9d8..z.hDcPLnA7oEH53dekwkgCQ6pffX_u0Xw7HgUE3cO_naqRmNL0c2pYm_jh99ORWi58o7pEZDC7rx';
                    String clientSecret = '7763307931064157349';
                    String username='priya@brillio.com';
                    String password='ambi@20129JWEiJBJqwUBYP6Ni8YMQ6NC';
      				String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
                   
      				//JSON Data to send other org
                    String jsonstr=data;
      				//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
      				//for single object update URL='/services/data/v41.0/sobjects/account'
                    String URL='/services/data/v34.0/composite/tree/Account/';
                     
                    Http h = new Http();
                    HttpRequest req = new HttpRequest();
                    req.setBody(reqbody);
                    req.setMethod('POST');
      
     				 //Note if my domain is set up use the proper domain name else use login.salesforce.com for prod or developer or test.salesforce.com for sandbox instance
                    req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
                     System.debug('---------------'+req);
                   // HttpResponse res = h.send(req);
                   // System.debug('---------------'+res.getBody());
      				
                   /* OAuth2 objAuthenticationInfo = (OAuth2)JSON.deserialize(res.getbody(), OAuth2.class);
                    
       if(objAuthenticationInfo.access_token!=null){
                      Http h1 = new Http();
                      HttpRequest req1 = new HttpRequest();
           
                      req1.setHeader('Authorization','Bearer '+objAuthenticationInfo.access_token);
                      req1.setHeader('Content-Type','application/json');
                      req1.setHeader('accept','application/json');
                      req1.setBody(jsonstr);//Send JSON body
                      req1.setMethod('POST');
           				//URL will be your Salesforce REST API end point where you will do POST,PUT,DELETE orGET
                      req1.setEndpoint(objAuthenticationInfo.instance_url+URL);
                      
                      HttpResponse res1 = h1.send(req1);
                      system.debug('RESPONSE_BODY'+res1 .getbody());
                    }*/
      
      
        }
    

}