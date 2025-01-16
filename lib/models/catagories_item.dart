// ignore_for_file: public_member_api_docs, sort_constructors_first
class CatagoriesItem {
  final String id;
  final String title;
  final String imageUrl;
  

  CatagoriesItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    
  });
}

List<CatagoriesItem> catagories = [
  CatagoriesItem(
      id: '1',
      title: 'Burger',
      imageUrl: 'assets/images/catagories/cheeseburger.png',
      
      ),
  CatagoriesItem(
      id: '2', title: 'Pizza', imageUrl: 'assets/images/catagories/pizza.png',),
  CatagoriesItem(
      id: '3',
      title: 'Pasta',
      imageUrl: 'assets/images/catagories/spaguetti.png',),
  CatagoriesItem(
      id: '4',
      title: 'Shawarma',
      imageUrl: 'assets/images/catagories/shawarma.png',),
  CatagoriesItem(
      id: '5', title: 'Hotdog', imageUrl: 'assets/images/catagories/hot-dog.png',),
  CatagoriesItem(
      id: '6',
      title: 'Nuggets',
      imageUrl: 'assets/images/catagories/fried-chicken.png',),
];
