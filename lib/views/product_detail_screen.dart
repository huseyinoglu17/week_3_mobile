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
      backgroundColor: Colors.white,

      appBar: AppBar(title: const Text("Back"), backgroundColor: Colors.white),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.findProduct.image!,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.findProduct.name!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          widget.findProduct.tagline!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          widget.findProduct.description!,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.grey.shade800,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "${widget.findProduct.price!}",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
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
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      margin: const EdgeInsets.only(
                        bottom: 82,
                        left: 10,
                        right: 10,
                      ),
                      content: Text(
                        "${widget.findProduct.name} added to cart",
                        style: const TextStyle(fontSize: 16),
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },

                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
