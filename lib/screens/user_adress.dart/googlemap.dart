import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/user_adress.dart/geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoMap extends StatefulWidget {
  @override
  _GoMapState createState() => _GoMapState();
}

class _GoMapState extends State<GoMap> {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return SafeArea(
      child: Scaffold(
        body: (applicationBloc.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.purple,
                ),
              )
            : Container(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(applicationBloc.currentLocation.latitude,
                          applicationBloc.currentLocation.longitude),
                      zoom: 14),
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                ),
              ),
      ),
    );
  }
}
