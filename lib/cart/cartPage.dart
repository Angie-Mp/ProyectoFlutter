import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cart/products.dart';
import 'package:flutter_app/utils/font_styles.dart';

import 'package:flutter_app/routes/routesApp.dart';

class CartPage extends StatefulWidget {
  List<ProductModel>? listCartProducts;

  CartPage({Key? key, this.listCartProducts}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        toolbarHeight: kToolbarHeight * 1.25,
        centerTitle: true,
        title: Text('Pedido : ${(widget.listCartProducts ?? []).length}'),
        titleTextStyle: FontStyles.title.copyWith(
          color: Colors.white,
        ),
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
                    itemCount: widget.listCartProducts?.length,
                    itemBuilder: (context, index) {
                      ProductModel producto =
                          widget.listCartProducts?[index] ?? ProductModel();
                      String name = widget.listCartProducts?[index].name ?? '';
                      double price = widget.listCartProducts?[index].price ?? 0;
                      int quantity =
                          widget.listCartProducts?[index].quantity ?? 0;
                      String image =
                          widget.listCartProducts?[index].image ?? '';

                      return Card(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                child: Image.asset(image),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      name,
                                      style: FontStyles.title2,
                                    ),
                                    Text(
                                      '${price}',
                                      style: FontStyles.subtitle,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0XFFE8E9E9),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ProductCounterItem(
                                              icon: Icons.remove,
                                              onPressed: () {
                                                widget.listCartProducts?[index]
                                                    .quantity = (widget
                                                            .listCartProducts?[
                                                                index]
                                                            .quantity ??
                                                        0) -
                                                    1;
                                                setState(() {});
                                                print('se reduce un producto');
                                              },
                                            ),
                                            Text(
                                              '${quantity}',
                                              style: FontStyles.title2,
                                            ),
                                            ProductCounterItem(
                                              icon: Icons.add,
                                              onPressed: () {
                                                widget.listCartProducts?[index]
                                                    .quantity = (widget
                                                            .listCartProducts?[
                                                                index]
                                                            .quantity ??
                                                        0) +
                                                    1;

                                                setState(() {});
                                                print('se aumenta un producto');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                '${price * quantity}',
                                style: FontStyles.title,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const CartCoupon(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: FontStyles.subtitle,
                        ),
                        Text(
                          "${priceTotalFunction(widget.listCartProducts ?? [])}",
                          style: FontStyles.subtitle,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: FontStyles.title,
                        ),
                        Text(
                          "${priceCalcularDescFunction(widget.listCartProducts ?? [])}",
                          style: FontStyles.title,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Compra Exitosa'),
              content: const Text("Gracias por ser parte del cambio"),
              actions: <Widget>[
                MaterialButton(
                    child: const Text("Aceptar"),
                    textColor: Color(0xFFFF6C44),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
                    }),
              ],
            ),
          );
        },
        label: Container(
            width: 280,
            height: 60,
            child: const Center(
              child: Text('Cancelar pedido'),
            )),
        backgroundColor: Color(0xFFFF6C44),
      ),
    );
  }

  double priceTotalFunction(List<ProductModel> listCartProducts) {
    double pricetotal = 0;
    listCartProducts.forEach((element) {
      pricetotal += (element.quantity ?? 0) * (element.price ?? 0);
    });
    return pricetotal;
  }
}

double priceCalcularDescFunction(List<ProductModel> listCartProducts) {
  double pricetotal = 0;
  double subPrecio = 0;
  listCartProducts.forEach((element) {
    pricetotal += ((element.quantity ?? 0) * (element.price ?? 0));
    double descuento = pricetotal * 0.15;

    subPrecio = pricetotal - descuento;
  });
  return subPrecio;
}

//Campo de texto para el cupon
class CouponTextField extends StatefulWidget {
  const CouponTextField({
    Key? key,
  }) : super(key: key);
  @override
  State<CouponTextField> createState() => _CouponTextFieldState();
}

class _CouponTextFieldState extends State<CouponTextField> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = 'Descuento';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: FontStyles.regular,
      onChanged: (value) {
        print(controller.text);
      },
      decoration: const InputDecoration(
        constraints: BoxConstraints(
          maxWidth: 150,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

//Barra de cupon
class CartCoupon extends StatelessWidget {
  const CartCoupon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CouponTextField(),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: RoundedButton(
              padding: const EdgeInsets.all(10),
              label: '15% del consumo ',
              labelColor: Colors.white,
              onPressed: () {},
              color: const Color(0xFFFF6C44),
            ),
          ),
        ],
      ),
    );
  }
}

//Boton redondeado
class RoundedButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String label;
  final Color color;
  final Color labelColor;
  final VoidCallback onPressed;
  final bool isFullWidth;

  const RoundedButton({
    Key? key,
    this.padding,
    required this.label,
    this.color = const Color(0XFF1E1F1E),
    this.labelColor = Colors.white,
    required this.onPressed,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: CupertinoButton(
        padding: padding,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: //const Color(0XFF1E1F1E),
            color,
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            // 'Order',
            label,
            maxLines: 1,
            style: FontStyles.regular.copyWith(
              fontSize: isFullWidth ? 16 : 14,
              color: labelColor,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCounterItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const ProductCounterItem({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 13,
      padding: const EdgeInsets.all(4),
      onPressed: onPressed,
      icon: Icon(
        //Icons.remove,
        icon,
      ),
    );
  }
}
