public class RewardsCalloutService{

    public static Integer submitUsersForRewardCallout(String jsonBody) {
        //Set Endpoint from Named Credential
        String endpoint = 'callout:IntegrationSB__BalancedLiving/rewards';
        Http htt = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        //req.setHeader('Authorization','Bearer '+ UserInfo.getSessionId());
        req.setHeader('Content-Type','application/json');
        req.setEndpoint(endpoint);
        req.setBody(jsonBody);
        HttpResponse res = new HttpResponse();
        res = htt.send(req);
             
        //Make HTTP Callout
        System.debug(res);
        
        //Update to return response status code
        return res.getStatusCode();    
    }
}