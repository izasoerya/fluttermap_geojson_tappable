import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:kunci_determinasi/src/database/controller/geojson_controller.dart';
import 'package:kunci_determinasi/src/maps_page/screen/popup_dialog.dart';

class TappablePolyline extends StatelessWidget {
  const TappablePolyline({
    super.key,
    required this.data,
    this.onPressed,
  });
  final List<dynamic> data;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const GeoParser parser = GeoParser(file: 1); // data sleman (polyline)
    List<TaggedPolyline> polylines = [];

    final dataPolyline = parser
        .getListOfLatLng(); // actually return List<Polyline> instead of List<dynamic>
    for (var i = 0; i < dataPolyline.length; i++) {
      final polyline = dataPolyline[i] as Polyline; // cast to Polyline
      polylines.add(TaggedPolyline(
        color: Colors.blue,
        points: polyline.points,
      ));
    }

    return TappablePolylineLayer(
      polylines: polylines,
      onTap: (polylines, tapPosition) {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return const ShowDialogPopUp();
            });
      },
    );
  }
}
