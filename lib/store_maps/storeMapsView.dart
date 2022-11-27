import 'package:flutter/material.dart';
import 'package:flutter_app/store_maps/map_marker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const mapBoxToken =
    'pk.eyJ1IjoiamltbG96MjQiLCJhIjoiY2t1NHo1anNsMjBjZTMxcG1mMHdpZW1vcSJ9.KD5Nm1oREtc9zGOvzj_fSA';
const mapBoxStyle = 'mapbox/streets-v11';

const markerColor = Color(0XFFFF6C44);
const markerSizeExpanded = 60.0;
const markerSizeShrinked = 55.0;

final _myLocation = LatLng(-12.1017967, -77.0409057);

class StoreMapsView extends StatefulWidget {
  const StoreMapsView({Key? key}) : super(key: key);

  @override
  State<StoreMapsView> createState() => _StoreMapsViewState();
}

class _StoreMapsViewState extends State<StoreMapsView> {
  final _pageController = PageController();
  int? _selectedIndex;
  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          height: markerSizeExpanded,
          width: markerSizeExpanded,
          point: mapItem.location,
          builder: (_) {
            return GestureDetector(
              onTap: () {
                _selectedIndex = i;
                debugPrint('selected ${mapItem.title}');
                _pageController.animateToPage(i,
                    duration: const Duration(microseconds: 400),
                    curve: Curves.elasticOut);
                setState(() {});
              },
              child: _LocationMarker(
                selected: _selectedIndex == i,
              ),
            );
          },
        ),
      );
    }
    return _markerList;
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: FlutterMap(
              options: MapOptions(
                minZoom: 14.0,
                maxZoom: 18.0,
                zoom: 15.0,
                center: _myLocation,
              ),
              nonRotatedLayers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: {
                    'accessToken': mapBoxToken,
                    'id': mapBoxStyle,
                  },
                ),
                MarkerLayerOptions(
                  markers: _markers,
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      point: _myLocation,
                      builder: (_) {
                        return const _MyLocationMarker();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 40.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Color(0XFFBDBDBD),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/markers/store.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            right: 30.0,
            bottom: 30.0,
            height: MediaQuery.of(context).size.height * 0.18,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: mapMarkers.length,
              itemBuilder: ((context, index) {
                final item = mapMarkers[index];

                return _MapItemDetails(
                  mapMarker: item,
                  onPressed: () {
                    final nextTo = index + 1;
                    if (nextTo < mapMarkers.length) {
                      _selectedIndex = nextTo;
                    } else {
                      _selectedIndex = index;
                    }
                    _pageController.animateToPage(
                      nextTo,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.elasticInOut,
                    );
                    setState(() {});
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// Stores location
class _LocationMarker extends StatelessWidget {
  const _LocationMarker({
    Key? key,
    this.selected = false,
  }) : super(key: key);
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final double size = selected ? markerSizeExpanded : markerSizeShrinked;
    return Center(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'assets/markers/store.jpg',
            ),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
          shape: BoxShape.circle,
          border: selected
              ? Border.all(
                  width: 4.0,
                  color: const Color(0XFFFF6C44),
                )
              : Border.all(
                  style: BorderStyle.none,
                ),
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        height: size,
        width: size,
      ),
    );
  }
}

//marker that represents your current position
class _MyLocationMarker extends StatelessWidget {
  const _MyLocationMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60.0,
        width: 60,
        decoration: const BoxDecoration(
          color: markerColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

//Store Card
class _MapItemDetails extends StatelessWidget {
  const _MapItemDetails({
    Key? key,
    required this.mapMarker,
    required this.onPressed,
  }) : super(key: key);
  final MapMarker mapMarker;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      elevation: 4.0,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                splashRadius: 15.0,
                onPressed: onPressed,
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(mapMarker.image),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mapMarker.title,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        mapMarker.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF828282),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Visitar Tienda',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0XFF6FCF97),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
