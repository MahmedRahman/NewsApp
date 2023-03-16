import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';

class HomeApi extends GetConnect {
  Future<List> getNews() async {
    Response response = await get(
        "https://newsapi.org/v2/everything?q=tesla&from=2023-02-16&sortBy=publishedAt&apiKey=25ea9390bd8f45059600a406d4c6b3cc&language=ar&pageSize=2");

    return response.body["articles"];
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Column(
        children: [
          newsCard(
            title: "Chase Sapphire Rental Car Insurance Benefits Guide",
            description: "Chase Sapphire Rental Car Insurance Benefits Guide",
            ImageUrl: "https://johnnyjet.com/wp-content/uploads/2015/11/017-e1589995508894.jpg",
          ),
          newsCard(
            title: "Chase Sapphire Rental Car Insurance Benefits Guide",
            description: "Chase Sapphire Rental Car Insurance Benefits Guide",
            ImageUrl: "https://johnnyjet.com/wp-content/uploads/2015/11/017-e1589995508894.jpg",
          ),
        ],
      ),
    );
  }

  Widget newsCard({
    required String ImageUrl,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              ImageUrl,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
