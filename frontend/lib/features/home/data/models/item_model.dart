class Item {
  String name;
  double price;
  String description;
  String imageUrl;

  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}



List<Item> mockShoppingItems = [
  Item(
    name: "Apple iPhone 15",
    price: 999.99,
    description: "Latest Apple iPhone with A17 Bionic chip and 120Hz display.",
    imageUrl: "https://example.com/iphone15.jpg",
  ),
  Item(
    name: "Samsung Galaxy S23",
    price: 849.99,
    description: "Samsung's flagship phone with a stunning AMOLED display.",
    imageUrl: "https://example.com/galaxy_s23.jpg",
  ),
  Item(
    name: "Sony WH-1000XM5 Headphones",
    price: 399.99,
    description: "Industry-leading noise canceling wireless headphones.",
    imageUrl: "https://example.com/sony_headphones.jpg",
  ),
  Item(
    name: "Apple MacBook Pro 16-inch",
    price: 2499.99,
    description: "Powerful M3 Pro chip with Liquid Retina XDR display.",
    imageUrl: "https://example.com/macbook_pro.jpg",
  ),
  Item(
    name: "Nike Air Max 270",
    price: 150.00,
    description: "Stylish and comfortable sneakers with a large air unit.",
    imageUrl: "https://example.com/nike_airmax.jpg",
  ),
  Item(
    name: "Amazon Echo Dot (5th Gen)",
    price: 49.99,
    description: "Smart speaker with Alexa voice assistant and improved sound.",
    imageUrl: "https://example.com/echo_dot.jpg",
  ),
  Item(
    name: "Logitech MX Master 3S",
    price: 99.99,
    description: "Advanced wireless mouse with precision tracking.",
    imageUrl: "https://example.com/logitech_mx_master.jpg",
  ),
  Item(
    name: "Samsung 55-inch 4K Smart TV",
    price: 699.99,
    description: "Crystal UHD display with HDR10+ and smart features.",
    imageUrl: "https://example.com/samsung_4k_tv.jpg",
  ),
  Item(
    name: "Dyson V11 Cordless Vacuum",
    price: 599.99,
    description: "High-power suction vacuum cleaner for deep cleaning.",
    imageUrl: "https://example.com/dyson_vacuum.jpg",
  ),
  Item(
    name: "Bose SoundLink Revolve+",
    price: 299.99,
    description: "360-degree portable Bluetooth speaker with deep bass.",
    imageUrl: "https://example.com/bose_speaker.jpg",
  ),
];

