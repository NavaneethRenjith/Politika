import 'package:flutter/material.dart';

import './detailed_news_page.dart';
import '../location_search_bar.dart';

List titleList = ["Title1 ", "Title2", "Title3", "Title4", "Title5"];
List descList = [
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in",
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Politika',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: searchBar(context),
                // ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    itemCount: titleList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          child: newsTile(
                            titleList[index],
                            descList[index],
                            context,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DetailedNews(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          LocationSearchBar(),
        ],
      ),
    );
  }
}

Widget searchBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.06,
    decoration: BoxDecoration(
      color: Color(0xFFF3F5FA),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
        Icon(
          Icons.search,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'Search',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

Widget newsTile(String title, String desc, BuildContext context) {
  return Container(
    padding: EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      color: Color(0xFFF3F5FA),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .85,
            height: MediaQuery.of(context).size.height * .09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage('assets/image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          maxLines: 2,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          desc,
          maxLines: 2,
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ],
    ),
  );
}
