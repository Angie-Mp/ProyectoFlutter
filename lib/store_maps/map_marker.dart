import 'package:latlong2/latlong.dart';

class MapMarker {
  const MapMarker({
    required this.image,
    required this.title,
    required this.description,
    required this.location,
  });
  final String image;
  final String title;
  final String description;
  final LatLng location;
}

final _locations = [
  LatLng(-12.1048604, -77.0423994),
  LatLng(-12.1041124, -77.0453362),
  LatLng(-12.1261752, -77.0330305),
  LatLng(-12.1182332, -77.0196575),
  LatLng(-12.1056055, -77.0417038),
  LatLng(-12.1061666, -77.040796),
  LatLng(-12.1041427, -77.0385507),
  LatLng(-12.1009776, -77.0386142),
  LatLng(-12.1064598, -77.0402826),
  LatLng(-12.1064598, -77.0402826),
];
const _path = 'assets/markers/';
final mapMarkers = [
  MapMarker(
    image: '${_path}dasso.jpg',
    title: 'Bottega Dasso',
    description: 'Restaurante',
    location: _locations[0],
  ),
  MapMarker(
    image: '${_path}franklin.jpg',
    title: 'Franklin Restaurante',
    description: 'Restaurante',
    location: _locations[1],
  ),
  MapMarker(
    image: '${_path}papachos.jpg',
    title: 'Papachos',
    description: 'Hamburguesería',
    location: _locations[2],
  ),
  MapMarker(
    image: '${_path}gelato.jpg',
    title: 'Artisan Gelato',
    description: 'Heladería',
    location: _locations[3],
  ),
  MapMarker(
    image: '${_path}bistecca.jpg',
    title: 'LA BISTECCA',
    description: 'Buffet Libre',
    location: _locations[4],
  ),
  MapMarker(
    image: '${_path}saki.jpg',
    title: 'Saki Poké & Bowls',
    description: 'Comida Hawaina',
    location: _locations[5],
  ),
  MapMarker(
    image: '${_path}fungkuan.jpg',
    title: 'Chifa Fung Kuan',
    description: 'Restaurante Cantonés',
    location: _locations[6],
  ),
  MapMarker(
    image: '${_path}primos.jpg',
    title: 'Primos Chicken',
    description: 'Pollería',
    location: _locations[7],
  ),
  MapMarker(
    image: '${_path}quinoa.jpg',
    title: 'Quinoa Café',
    description: 'Restaurante',
    location: _locations[8],
  ),
  MapMarker(
    image: '${_path}delicass.jpg',
    title: 'Delicass Dasso',
    description: 'Cafetería',
    location: _locations[9],
  ),
];
