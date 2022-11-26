import 'package:flutter/material.dart';
import 'package:flutter_app/cart/cartPage.dart';
import 'package:flutter_app/utils/font_styles.dart';

class ProductModel {
  String? name;
  double? price;
  int? quantity; //cantidad del usuario
  int? stock; // cantidad company
  String? image;
  bool? view;

  ProductModel(
      {this.name,
      this.price,
      this.quantity = 0,
      this.stock,
      this.image,
      this.view = true});
}

class ProductsViews extends StatefulWidget {
  const ProductsViews({Key? key}) : super(key: key);

  @override
  State<ProductsViews> createState() => _ProductsViewsState();
}

class _ProductsViewsState extends State<ProductsViews> {
  List<ProductModel> listProducts = [
    ProductModel(
        name: "Chaufa", price: 14, stock: 6, image: "assets/chaufa.png"),
    ProductModel(
        name: "Ensalada", price: 10, stock: 6, image: "assets/ensalada.png"),
    ProductModel(
        name: "Ensalada",
        price: 10,
        stock: 6,
        image: "assets/ensaladaTomate.png"),
    ProductModel(name: "Pollo", price: 17, stock: 6, image: "assets/pollo.png"),
  ];

  List<ProductModel> listCartProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: kToolbarHeight * 1.25,
        title: const Text('Productos'),
        titleTextStyle: FontStyles.title.copyWith(
          color: Colors.white,
        ),
        leading: Icon(Icons.add, color: Color(0xFFFF6C44)),
        actions: [
          IconButton(
            splashRadius: 16,
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                return CartPage(
                  listCartProducts: listCartProducts,
                );
              }, transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(opacity: animation, child: child);
              }));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: const Color(0xFFFF6C44),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listProducts.length,
                    itemBuilder: (context, index) {
                      ProductModel producto = listProducts[index];
                      String name = listProducts[index].name ?? '';
                      double price = listProducts[index].price ?? 0;
                      bool view = listProducts[index].view ?? true;
                      String image = listProducts[index].image ?? '';

                      return (view == true)
                          ? InkWell(
                              onTap: () {
                                //mas uno al carrito de compras
                                producto.quantity =
                                    (producto.quantity ?? 0) + 1;
                                //agregamos carrito del usuario
                                listCartProducts.add(producto);

                                //deshabilitar el icono mas del producto de la tienda
                                listProducts[index].view = false;
                                setState(() {});
                              },
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      20,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 45,
                                        backgroundColor: Colors.white,
                                        child: Image.asset(image),
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              name,
                                              style: FontStyles.title2,
                                            ),
                                            Text(
                                              's/.${price}',
                                              style: FontStyles.subtitle,
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
