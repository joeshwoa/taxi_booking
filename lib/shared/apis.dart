class APIs {
  static String baseURL = 'https://kiro-travel-hotel-dev-e2b128d2528a.herokuapp.com';
  static String shuttleURL = 'https://service-fare-pricing-3dcd0b892332.herokuapp.com';

  static String getTaxiPrice = '$shuttleURL/ride/price';
  static String requestTaxi = '$baseURL/taxi/drives/';
}