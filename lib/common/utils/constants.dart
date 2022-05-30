class Api {
  static const String baseUrl = 'http://api.elevenia.co.id/';
  static const String token = '721407f393e84a28593374cc2b347a98';
  static const headers = {
    'Content-Type': 'application/xml',
    'Accept-Charset': 'utf-8',
    'openapikey': token
  };

  static const String products = 'rest/prodservices/product/listing?page=';
  static const String detail = 'rest/prodservices/product/details/';
}
