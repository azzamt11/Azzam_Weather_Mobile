class Constants {

  String apiKey= "2RPC45GWNEZMY6SVM2HY6B6WA";
  String baseUrl= "https://weather.visualcrossing.com";
  String query= "VisualCrossingWebServices/rest/services/timeline/jakarta?unitGroup=metric";
  
  String getEndpoint() {
    return "$baseUrl/$query&key=$apiKey&contentType=json";
  }

  Map<int, String> errorCodes= {

    //client side errors
    400: "Bad Request",
    401: "Unauthorized",
    402: "Payment Required",
    403: "Forbidden",
    404: "Not Found", 
    405: "Method Not Allowed",
    406: "Not Acceptable",
    407: "Proxy Authentication Required",
    408: "Request Timeout",
    409: "Conflict",
    410: "Gone",
    411: "Length Required",
    412: "Precondition Failed",
    413: "Payload Too Large",
    414: "URI Too Long",
    415: "Unsupported Media Type",
    416: "Range Not Satisfiable",
    417: "Expectation Failed",
    418: "I'm a teapot",
    421: "Misdirected Request",
    422: "Unprocessable Entity",
    424: "Failed Dependency",
    426: "Upgrade Required",
    429: "Too Many Requests",
    
    //server side errors
    501: "Not Implemented",
    502: "Bad Gateway",
    503: "Service Unavailable",
    504: "Gateway Timeout",
    505: "HTTP Version Not Supported",
    507: "Insufficient Storage",
    508: "Loop Detected",
    511: "Network Authentication Required"
  };
}