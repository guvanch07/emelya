import 'package:emelya/constants/app_colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapBox extends StatefulWidget {
  const MapBox({Key? key}) : super(key: key);

  @override
  _MapBoxState createState() => _MapBoxState();
}

var points = <LatLng>[
  LatLng(53.970676, 27.456238),
  LatLng(53.943421, 27.398647),
  LatLng(53.895829, 27.395858),
  LatLng(53.866333, 27.411401),
  LatLng(53.837594, 27.460420),
  LatLng(53.826840, 27.547738),
  LatLng(53.829528, 27.658592),
  LatLng(53.873869, 27.705668),
  LatLng(53.926657, 27.697316),
  LatLng(53.962408, 27.666944),
  LatLng(53.983844, 27.600128),
  LatLng(53.980272, 27.478643),
  LatLng(53.970676, 27.456238),
];

class _MapBoxState extends State<MapBox> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(53.906819, 27.544538),
        minZoom: 10.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/guvanch777/ckrxa286w1zn418muo3mel0xw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZ3V2YW5jaDc3NyIsImEiOiJja3J4OWlnYXowb2Q2MnVvMjlrYWN6Y3AyIn0.yfh0ih1mkCvczIT4sGu0DA',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoiZ3V2YW5jaDc3NyIsImEiOiJja3J4OWlnYXowb2Q2MnVvMjlrYWN6Y3AyIn0.yfh0ih1mkCvczIT4sGu0DA',
              'id': 'mapbox.mapbox-streets-v7'
            }),
        // MarkerLayerOptions(markers: [
        //   Marker(
        //       point: LatLng(40.73, -74.00),
        //       builder: (context) => Container(
        //             width: 45,
        //             height: 45,
        //             child: IconButton(
        //               icon: Icon(Icons.location_on),
        //               color: Colors.red,
        //               iconSize: 45.0,
        //               onPressed: () {
        //                 ('tapped');
        //               },
        //             ),
        //           ))
        // ])
        PolylineLayerOptions(polylines: [
          Polyline(
            points: points,
            strokeWidth: 2.0,
            borderColor: AppColors.purple,
            borderStrokeWidth: 0.1,
            color: AppColors.purple,
          )
        ])
      ],
    );
  }
}
