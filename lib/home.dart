import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeApi extends GetConnect {
  Future<List> getNews() async {
    Response response = await get(
      "https://629656fc75c34f1f3b2e0b36.mockapi.io/api/v1/news",
      // headers: {
      //   "X-Api-Key": "25ea9390bd8f45059600a406d4c6b3cc",
      // },
    );

    print(response.body);

    return response.body;
  }
}

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: HomeApi().getNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: List.generate(snapshot.data!.length, (index) {
                      return newsCard(
                        title: snapshot.data!.elementAt(index)["title"],
                        description: snapshot.data!.elementAt(index)["description"],
                        ImageUrl: snapshot.data!.elementAt(index)["urlToImage"],
                      );
                    }),
                  );
                }

                return CircularProgressIndicator();
              }),
        ),
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
