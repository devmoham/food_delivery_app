import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  Widget Ordersvouchers(BuildContext context,
      {required String name, required int number}) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          number.toString(),
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange),
        ),
      ],
    );
  }

  Widget personPhoto(double height, double width) {
    return Container(
      height: height,
      width: width,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/mohamed.jpg'),
      ),
    );
  }

  Widget ListTalied(BuildContext context,
      {required String title, required IconData icon}) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: Icon(Icons.chevron_right_sharp),
      onTap: () => debugPrint('clicked'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    const name = Text(
      'Mohamed Mostafa',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!isLandScape) ...[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/mohamed.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Mohamed Mostafa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ordersvouchers(context, name: 'Orders', number: 50),
                  SizedBox(
                    height: 8.0,
                  ),
                  Ordersvouchers(context, name: 'Vouchers', number: 10),
                ],
              ),
            ],
            if (isLandScape) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    personPhoto(size.height * 0.5, size.width * 0.25),
                    SizedBox(
                      height: 16.0,
                    ),
                    name,
                  ]),
                  Column(
                    children: [
                      Ordersvouchers(context, name: 'Orders', number: 50),
                      SizedBox(
                        height: 16.0,
                      ),
                      Ordersvouchers(context, name: 'Vouchers', number: 10),
                    ],
                  )
                ],
              ),
            ],
            const Divider(
              thickness: 0.5,
              indent: 15,
              endIndent: 15,
            ),
            ListTalied(context,
                title: 'Past Orders', icon: Icons.shopping_cart),
            ListTalied(context,
                title: 'Avalible Vouchers', icon: Icons.card_giftcard),
          ],
        ),
      ),
    );
  }
}
