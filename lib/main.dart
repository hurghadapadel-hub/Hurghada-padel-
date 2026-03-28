import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hurghada Padel',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  int getPrice(int hour) {
    if (hour >= 6 && hour < 18) return 350;
    return 400;
  }

  void openWhatsApp() async {
    final url = "https://wa.me/201146355059";
    await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hurghada Padel")),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 24,
        itemBuilder: (context, index) {
          int price = getPrice(index);

          return Card(
            color: Colors.green,
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("تم الحجز"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("السعر: $price جنيه"),
                        Text("Instapay: 01146355059"),
                        ElevatedButton(
                          onPressed: openWhatsApp,
                          child: Text("WhatsApp"),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Center(
                child: Text("$index:00\n$price"),
              ),
            ),
          );
        },
      ),
    );
  }
}
