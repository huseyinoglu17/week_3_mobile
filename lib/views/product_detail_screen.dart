import 'package:material_ui/material_ui.dart';
import 'package:week_3_mobile/models/products_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data findProduct;
  final Set<int> cartIds;

  const ProductDetailScreen({
    super.key,
    required this.findProduct,
    required this.cartIds,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
        title: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.findProduct.image!,
                        height: 320,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        color: Colors.black.withValues(alpha: 0.2),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name
                        Text(
                          widget.findProduct.name!,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Product Tagline
                        Text(
                          widget.findProduct.tagline!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade400,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Description
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade300,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          widget.findProduct.description!,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.grey.shade400,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        const SizedBox(height: 26),

                        // Price Container
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "${widget.findProduct.price!}",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.green.shade400,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 130),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Add to Cart Button
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 65),
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.grey.shade900,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 25,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),

                onPressed: () {
                  setState(() {
                    widget.cartIds.add(widget.findProduct.id!);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.grey.shade800,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 82,
                        left: 15,
                        right: 15,
                      ),
                      content: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green.shade400,
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: Text(
                              "${widget.findProduct.name} added to cart",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.grey.shade900,
                      size: 25,
                    ),

                    const SizedBox(width: 10),

                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
