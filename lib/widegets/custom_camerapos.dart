import 'package:google_maps_flutter/google_maps_flutter.dart';

extension CameraPositionCopyWithExtension on CameraPosition {
  CameraPosition copyWith({
    double? bearing,
    LatLng? target,
    double? tilt,
    double? zoom,
  }) {
    return CameraPosition(
      bearing: bearing ?? this.bearing,
      target: target ?? this.target,
      tilt: tilt ?? this.tilt,
      zoom: zoom ?? this.zoom,
    );
  }
}
