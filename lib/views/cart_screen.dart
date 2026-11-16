import 'package:material_ui/material_ui.dart';
import 'package:week_3_mobile/components/card_tile.dart';
import 'package:week_3_mobile/models/products_model.dart';

class CartScreen extends StatefulWidget {
  final List<Data> allProducts;
  final Set<int> cartIds;

  const CartScreen({
    super.key,
    required this.allProducts,
    required this.cartIds,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.allProducts
        .where((element) => widget.cartIds.contains(element.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Colors.grey.shade300)),
        backgroundColor: Colors.grey.shade900,
        iconTheme: IconThemeData(color: Colors.grey.shade300),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: cartProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Your cart is empty",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 120),
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        final item = cartProducts[index];

                        return MiniCardTile(
                          name: item.name!,
                          tagline: item.tagline!,
                          price: item.price!,
                          imageUrl: item.image!,
                          onRemove: () {
                            setState(() {
                              widget.cartIds.remove(item.id);
                            });
                          },
                        );
                      },
                    ),
            ),

            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Text(
                  "Checkout",
                  style: TextStyle(fontSize: 26, color: Colors.grey.shade900),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
