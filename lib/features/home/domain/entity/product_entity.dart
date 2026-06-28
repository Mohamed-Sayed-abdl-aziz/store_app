class ProductEntity {
  ProductEntity({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
  });

  final int id;
  final String image;
  final String title;
  final String description;
  final String category;
  final double price;
}
