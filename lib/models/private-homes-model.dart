class PrivateHome {
  String name;
  String location;
  int imageNo;
  int price;
  int bedrooms;
  int bathrooms;
  double reviews;
  bool isLiked;
  bool parking;
  int visitors;

  PrivateHome({
    this.price,
    this.location,
    this.name,
    this.bedrooms,
    this.bathrooms,
    this.imageNo,
    this.reviews,
    this.isLiked,
    this.parking,
    this.visitors,
  });
}

List<PrivateHome> privateHomes = [
  PrivateHome(
    location: 'Red Oak 7',
    name: 'Predise Villa',
    imageNo: 1,
    price: 1278,
    bedrooms: 5,
    bathrooms: 4,
    reviews: 6.4,
    isLiked: false,
    parking: true,
    visitors: 2,
  ),
  PrivateHome(
    location: 'Madrid Street 10',
    name: 'Astounds Apartments',
    imageNo: 2,
    price: 2000,
    bedrooms: 4,
    bathrooms: 4,
    reviews: 10.2,
    isLiked: false,
    parking: true,
    visitors: 6,
  ),
  PrivateHome(
    location: 'Barcelona Town 6',
    name: 'Winscosed Mansion',
    imageNo: 3,
    price: 15000,
    bedrooms: 5,
    bathrooms: 5,
    reviews: 1.2,
    isLiked: false,
    parking: false,
    visitors: 8,
  ),
  PrivateHome(
    location: 'Manchester Sreet 12',
    name: 'Dijk Villas',
    imageNo: 4,
    price: 12000,
    bedrooms: 4,
    bathrooms: 4,
    reviews: 5.2,
    isLiked: false,
    parking: true,
    visitors: 0,
  ),
  PrivateHome(
    location: 'Manchester City 670',
    name: 'Refreded Appartments',
    imageNo: 5,
    price: 9000,
    bedrooms: 4,
    bathrooms: 5,
    reviews: 7.2,
    isLiked: false,
    parking: false,
    visitors: 20,
  ),
];
