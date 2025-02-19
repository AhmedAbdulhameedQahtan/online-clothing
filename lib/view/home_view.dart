import 'package:flutter/material.dart';
import 'package:online_clothing/resources/color_manager.dart';
import 'package:online_clothing/resources/values_manager.dart';
import 'package:online_clothing/view/add_product_view.dart';
import 'package:online_clothing/view/details_view.dart';
import '../controllers/api_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final ApiController apiController = ApiController();
  List<dynamic> products = [];
  List<dynamic> category = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      final productData = await apiController.fetchAllProducts();
      final categoryData = await apiController.fetchAllCategory();
      setState(() {
        products = productData;
        category = categoryData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> fetchCategoryData(String data) async {
    try {
      final productData = await apiController.fetchProductsCategory(data);
      setState(() {
        products = productData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        backgroundColor: ColorsManager.primary,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddProductPage()));
            }, child: const Text("Add Product"))
          ],
        ),
      ),
      body: isLoading
          ?  Center(child: CircularProgressIndicator(color: ColorsManager.primary,))
          : products == null
              ? const Center(child: Text('Failed to load data'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            return _buildCategoryChip(category[index]);
                          },
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: (){fetchData();}, child: Text("ALL Products",style: Theme.of(context).textTheme.headlineMedium,)
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // عدد الأعمدة
                            crossAxisSpacing: 8.0, // المسافة الأفقية بين البطاقات
                            mainAxisSpacing: 8.0, // المسافة العمودية بين البطاقات
                            childAspectRatio: 0.7, // نسبة العرض إلى الارتفاع
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            print(products[index]);
                            return _buildProductCard(products[index]);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child:InkWell(
        onTap: (){fetchCategoryData(label);},
        child: Chip(
            label: Text(label,style: Theme.of(context).textTheme.headlineMedium,),
          backgroundColor: ColorsManager.primary,
        ),
      )
    );
  }

  Widget _buildProductCard(product) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(product: product)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Expanded(
              child: Container(
                decoration:  BoxDecoration(
                  color: ColorsManager.whiteMore,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                  image: DecorationImage(
                    image: NetworkImage(product['image']),
                    // صورة افتراضية
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // تفاصيل المنتج
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text("\$${product['price']}",
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),

                   Row(
                    children: [
                      Text("${product['rating']['rate']}"),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                      const Icon(Icons.star, color: Colors.grey, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
