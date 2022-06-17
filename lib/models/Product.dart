class Product{
  final String title, description;
  final List <String> images;
  final double rating, price;
  final bool isPopular;

  Product({
    required this.images,
    this.rating = 0.0,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
});
}

// Our demo Products

List<Product> demoProducts = [
  Product(
      images: [
        "assets/images/ps4_console_white_1.png",
      ],
      title: "Mando para PS4",
      price: 64.99,
      description: "",
      rating: 4.8,
      isPopular: true,
  ),
  Product(
      images: [
        "assets/images/wireless headset.png",
      ],

      title: "Logitech Head",
      price: 50.5,
      description: "",
      rating: 4.1,
      isPopular: true,
  ),
  Product(
      images: [
        "assets/images/wireless headset.png",
      ],
      title: "Logitech Head",
      price: 36.55,
      description: "",
      rating: 4.1,
      isPopular: true
  ),
  Product(
      images: [
        "assets/images/wireless headset.png"
      ],

      title: "Logitech Head",
      price: 20.20,
      description: "",
      rating: 4.1,

  ),
];