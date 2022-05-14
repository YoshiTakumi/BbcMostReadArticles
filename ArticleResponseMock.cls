@isTest
global class ArticleResponseMock implements HttpCalloutMock {
    
    public static String responseBody;
    public static String status;
    public static Integer statusCode;

    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody(responseBody);
        response.setStatus(status);
        response.setStatusCode(statusCode);

        return response;
    }
}
