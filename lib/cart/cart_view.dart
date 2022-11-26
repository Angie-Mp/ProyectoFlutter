import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/font_styles.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({
    Key? key,
  }) : super(key: key);

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
        title: const Text('Order'),
        titleTextStyle: FontStyles.title.copyWith(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            splashRadius: 16,
            onPressed: () {},
            icon: const Icon(Icons.clear),
          ),
        ],
        backgroundColor: const Color(0XFF1C1C1F),
      ),
      backgroundColor: const Color(0XFFF5F4F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ).copyWith(
              bottom: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const ProductCard(
                        urlImage:
                            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                        productName: 'Avocado-Quinoa',
                        descrip: ' - 240 g',
                        price: 18,
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
                          'S/.46',
                          style: FontStyles.subtitle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: FontStyles.subtitle,
                        ),
                        Text(
                          'S/.46',
                          style: FontStyles.subtitle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: FontStyles.subtitle,
                        ),
                        Text(
                          'S/.46',
                          style: FontStyles.subtitle,
                        ),
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
                          'S/.138',
                          style: FontStyles.title,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundedButton(
                  label: 'Order',
                  onPressed: () {},
                  isFullWidth: true,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
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
              label: 'Promocode confirmed',
              labelColor: Colors.black,
              onPressed: () {},
              color: const Color(0XFFCAF510),
            ),
          ),
        ],
      ),
    );
  }
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
    controller.text = '32HHK4R0';
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

//Card del producto
class ProductCard extends StatelessWidget {
  final String urlImage;
  final String productName;
  final String descrip;
  final double price;
  const ProductCard({
    Key? key,
    required this.urlImage,
    required this.productName,
    required this.descrip,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              backgroundImage: NetworkImage(
                //  'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                urlImage,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    //'Avocado - Quinoa',
                    productName,
                    style: FontStyles.title2,
                  ),
                  Text(
                    //'-240 g',
                    descrip,
                    style: FontStyles.subtitle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ProductCounter(),
                ],
              ),
            ),
            Text(
              // 'S/.18',
              price.toString(),
              style: FontStyles.title,
            ),
          ],
        ),
      ),
    );
  }
}

//Contador
class ProductCounter extends StatefulWidget {
  const ProductCounter({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int counter = 0;

  void addProduct() {
    setState(() {
      setState(() {
        counter++;
        print('$counter');
      });
    });
  }

  void decreaseProduct() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    } else {
      print('No se puede reducir menos que  0');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                print('se reduce un producto');
                decreaseProduct();
              },
            ),
            Text(
              counter.toString(),
              style: FontStyles.title2,
            ),
            ProductCounterItem(
              icon: Icons.add,
              onPressed: () {
                print('se aumenta un producto');
                addProduct();
              },
            ),
          ],
        ),
      ),
    );
  }
}

//boton del contador (para disminuir o aumentar)
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
