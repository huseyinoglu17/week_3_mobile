import 'package:material_ui/material_ui.dart';
import 'package:week_3_mobile/models/products_model.dart';
import 'package:week_3_mobile/services/api_service.dart';
import 'package:week_3_mobile/components/product_card.dart';
import 'package:week_3_mobile/views/cart_screen.dart';
import 'package:week_3_mobile/views/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errorMessage = "";
  Set<int> cartIds = {};

  Future<void> loadProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      final productModel = await apiService.fetchProducts();

      setState(() {
        allProducts = productModel.data!;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Failed to load products";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => CartScreen(
                            allProducts: allProducts,
                            cartIds: cartIds,
                          )),
                        ),
                      );
                    },
                    iconSize: 42,
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),

              Text(
                "Explore the world with us",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
              ),

              SizedBox(height: 14),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://wantapi.com/assets/banner.png",
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  color: Colors.black.withValues(alpha: 0.5),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              SizedBox(height: 16),

              Expanded(
                child: GridView.builder(
                  itemCount: allProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final findProduct = allProducts[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              findProduct: findProduct,
                              cartIds: cartIds,
                            ),
                          ),
                        );
                      },
                      child: ProductCard(findProduct: findProduct),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
