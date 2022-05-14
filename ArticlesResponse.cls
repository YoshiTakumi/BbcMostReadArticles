public class ArticlesResponse {
    
    @AuraEnabled(cacheable=true)
    public static String getHTMLBody(){
        String htmlBody = makeGetCall().getBody();

        return htmlBody;
    }

    @TestVisible
    private static HttpResponse makeGetCall(){

        NewsCredentials__mdt nc = [SELECT EndPoint__c FROM NewsCredentials__mdt WHERE DeveloperName = 'BBC'];

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(nc.EndPoint__c);
        req.setMethod('GET');
        req.setHeader('Content-type', 'text/html; charset=utf-8');
        HttpResponse response = http.send(req);

        return response;
    }
}
