import 'package:rento/models/private-seller-model.dart';

class PerfectHome {
  String location;
  String name;
  int imageNo;
  int price;
  int bedrooms;
  int bathrooms;
  int visitors;
  double reviews;
  bool isLiked;
  List<Seller> sellers;
  bool parking;

  PerfectHome({
    this.location,
    this.name,
    this.imageNo,
    this.price,
    this.bedrooms,
    this.bathrooms,
    this.visitors,
    this.reviews,
    this.isLiked,
    this.sellers,
    this.parking,
  });
}

List<Seller> sellers = [
  Seller(
    sellerName: 'Cecilia Mueni',
    imageNo: 1,
    sellerType: 'Property Owner',
  ),
  Seller(
    sellerName: 'Kamau Broker',
    imageNo: 2,
    sellerType: 'Property Agent',
  ),
  Seller(
    sellerName: 'Andrew Kimani',
    imageNo: 3,
    sellerType: 'Property Owner',
  ),
  Seller(
    sellerName: 'Peter Paul',
    imageNo: 4,
    sellerType: 'Property Agent',
  ),
];

List<PerfectHome> perfectHomes = [
  PerfectHome(
    location: '272 S Rexford Dr',
    name: 'San Francisco Villa',
    imageNo: 1,
    price: 1293,
    bedrooms: 3,
    bathrooms: 2,
    reviews: 4.4,
    isLiked: false,
    sellers: sellers,
    parking: true,
    visitors: 2,
  ),
  PerfectHome(
    location: '452 Trenthouse Dr',
    name: 'Trents Mansion',
    imageNo: 2,
    price: 143,
    bedrooms: 4,
    bathrooms: 3,
    reviews: 3,
    isLiked: false,
    sellers: sellers,
    parking: true,
    visitors: 0,
  ),
  PerfectHome(
    location: '323 T Newshire',
    name: 'Revolt Villa',
    imageNo: 3,
    price: 133,
    bedrooms: 2,
    bathrooms: 3,
    reviews: 2.5,
    isLiked: false,
    sellers: sellers,
    parking: false,
    visitors: 10,
  ),
  PerfectHome(
    location: 'Freshire 323',
    name: 'Campordy Apartments',
    imageNo: 4,
    price: 493,
    bedrooms: 5,
    bathrooms: 3,
    reviews: 3.8,
    isLiked: false,
    sellers: sellers,
    parking: false,
    visitors: 2,
  ),
  PerfectHome(
    location: 'Windole Dr 34',
    name: 'Indopoes Villa',
    imageNo: 5,
    price: 4093,
    bedrooms: 3,
    bathrooms: 3,
    reviews: 10,
    isLiked: false,
    sellers: sellers,
    parking: true,
    visitors: 0,
  ),
];
