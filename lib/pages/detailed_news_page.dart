import 'package:flutter/material.dart';
import 'package:politika/models/news_model.dart';
import 'package:politika/pages/bookmarked_news_page.dart';

class DetailedNews extends StatelessWidget {
  final NewsModel newsModel;

  DetailedNews({required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: newsModel.title == null
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: NetworkImage(
                              newsModel.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newsModel.date + "          " + newsModel.time,
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            newsModel.isBookmarked = !newsModel.isBookmarked;
                            if (newsModel.isBookmarked) {
                              // bookmarkedNewsList.add(newsModel);
                            } else {
                              //  bookmarkedNewsList.remove(newsModel);
                              print("remove");
                            }
                          },
                          icon: newsModel.isBookmarked
                              ? Icon(Icons.bookmark)
                              : Icon(Icons.bookmark_add_outlined),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      newsModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      newsModel.desc,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
