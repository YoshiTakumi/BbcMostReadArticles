@isTest
public class ArticlesResponse_Test {
    
    @isTest
    static void makeGetCallTest404(){
        Test.startTest();
        ArticleResponseMock.responseBody = 'Error 404 page not found';
        ArticleResponseMock.status = 'Error';
        ArticleResponseMock.statusCode = 404;
        Test.setMock(HttpCalloutMock.class, new ArticleResponseMock());
        HttpResponse response = ArticlesResponse.makeGetCall();
        Test.stopTest();

        System.assertEquals(404,response.getStatusCode());
        System.assertEquals('Error',response.getStatus());
        System.assertEquals('Error 404 page not found',response.getBody());
    }

    @isTest
    static void makeGetCallTest200(){
        Test.startTest();
        ArticleResponseMock.responseBody = '<link rel="alternate" hreflang="en" href="https://www.bbc.com/news">';
        ArticleResponseMock.status = 'OK';
        ArticleResponseMock.statusCode = 200;
        Test.setMock(HttpCalloutMock.class, new ArticleResponseMock());
        HttpResponse response = ArticlesResponse.makeGetCall();
        Test.stopTest();

        System.assertEquals(200,response.getStatusCode());
        System.assertEquals('OK',response.getStatus());
        System.assertEquals('<link rel="alternate" hreflang="en" href="https://www.bbc.com/news">',response.getBody());
    }

    @isTest
    static void getHTMLBodyTest(){

        Test.startTest();
        ArticleResponseMock.responseBody = '<link rel="alternate" hreflang="en" href="https://www.bbc.com/news">';
        ArticleResponseMock.status = 'OK';
        ArticleResponseMock.statusCode = 200;
        Test.setMock(HttpCalloutMock.class, new ArticleResponseMock());
        String htmlBody = ArticlesResponse.getHTMLBody();
        Test.stopTest();

        System.assertEquals('<link rel="alternate" hreflang="en" href="https://www.bbc.com/news">',htmlBody);
    }
}
