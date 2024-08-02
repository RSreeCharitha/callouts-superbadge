@isTest
global class RewardsCalloutServiceMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest req){
        //create fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(req.getBody());
        response.setStatusCode(200);
        return response;
    }
}