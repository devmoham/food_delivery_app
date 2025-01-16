class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavorite;
  final String? catagoryId;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    this.catagoryId,
  });

  FoodItem copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
    String? catagoryId
  }) {
    return FoodItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      catagoryId: catagoryId ?? this.catagoryId
    );
  }
}

List<FoodItem> foods = [
  FoodItem(
    name: 'Burger',
    imageUrl:
        'assets/images/original/Burger-King-Whopper-Background-PNG-Image-2.png',
    price: 8,
    catagoryId: '1'
  ),
  FoodItem(
    name: 'Pizza',
    imageUrl: 'assets/images/original/Dominos-Pizza-Transparent-File.png',
    price: 6,
    catagoryId: '2'
  ),
  FoodItem(
    name: 'Chicken Burger',
    imageUrl:
        'assets/images/original/Classic-Chicken-Burger-Transparent-Background.png',
    price: 7,
    catagoryId: '1'
  ),
  FoodItem(
    name: 'Fried Chicken',
    imageUrl:
        'assets/images/original/Crispy-Fried-Chicken-PNG-Free-Download.png',
    price: 5,
    catagoryId: '6'
  ),
  FoodItem(
    name: 'Spaghetti',
    imageUrl: 'assets/images/original/Spaghetti-PNG-Pic-Background.png',
    price: 5,
    catagoryId: '3'
  ),
  FoodItem(
    name: 'Shawarma',
    imageUrl: 'assets/images/original/NicePng_shawarma-png_2968009.png',
    price: 6,
    catagoryId: '4'
  ),
  FoodItem(
    name: 'Hotdog',
    imageUrl: 'assets/images/original/Hot-Dog-No-Background.png',
    price: 7,
    catagoryId: '5'
  ),
];
