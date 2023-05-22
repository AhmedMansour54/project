import 'dart:math';

class Haversine {
  static const earthRadius = 6371.0; // In kilometers
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    final c = 2 * asin(sqrt(a));

    final distance = earthRadius * c;

    return distance;
  }

  static double _toRadians(double degrees) {
    return degrees * (pi / 180.0);
  }

  static const R = 6372.8; // In kilometers

  // static double haversine(double lat1, lon1, lat2, lon2) {
  //   double dLat = _toRadians(lat2 - lat1);
  //   double dLon = _toRadians(lon2 - lon1);
  //   lat1 = _toRadians(lat1);
  //   lat2 = _toRadians(lat2);
  //   double a =
  //       pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
  //   double c = 2 * asin(sqrt(a));
  //   return R * c;
  // }

  // static double _toRadians(double degree) {
  //   return degree * pi / 180;
  // }
}
