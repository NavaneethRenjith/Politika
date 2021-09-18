import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:politika/models/news_model.dart';

import './detailed_news_page.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class LocationPage extends StatefulWidget {
  String loc;
  LocationPage({required this.loc});
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  NewsModel newsModel = new NewsModel();
  List locationNewsList = [];
  Future getLocationNews() async {
    String path = "https://politika-rest-api.herokuapp.com/news/";
    var uri = Uri.parse(path + widget.loc);
    return await http.get(uri, headers: {
      'Content-Type': 'application/json',
    }).then((http.Response response) {
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        print(jsonData.length);

        locationNewsList = jsonData;

        return locationNewsList;
      } else {
        print(response);
        print("failed");
      }
    }).catchError((onError) {
      print(onError);
      print("error");
    });
  }

  void initState() {
    super.initState();
  }

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
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: FutureBuilder(
                        future: getLocationNews(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return Container(
                                child: ListView.builder(
                                    itemCount: locationNewsList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var exactdate = locationNewsList[0]
                                              ["date"]
                                          .split("T")
                                          .first;

                                      DateTime newdate =
                                          DateTime.parse(exactdate);
                                      String month =
                                          DateFormat.MMMM().format(newdate);
                                      String day = exactdate.split("-").last;
                                      String year = exactdate.split("-").first;
                                      String reqDate = "$day $month, $year";

                                      var exacttime = locationNewsList[0]
                                              ["date"]
                                          .split("T")
                                          .last;

                                      var specifictime =
                                          exacttime.split(".").first;

                                      var specific_time =
                                          specifictime.split(":");
                                      var req_time =
                                          "${specific_time[0]}:${specific_time[1]}";

                                      String am_pm;
                                      String time_in_other_format;
                                      if (int.parse(req_time.split(":").first) <
                                          12) {
                                        am_pm = "AM";
                                        time_in_other_format = req_time;
                                      } else {
                                        am_pm = "PM";
                                        time_in_other_format = (int.parse(
                                                    req_time.split(":").first) -
                                                12)
                                            .toString();
                                      }
                                      final final_req_time =
                                          "$time_in_other_format" +
                                              ":" +
                                              req_time.split(":").last +
                                              " " +
                                              am_pm;

                                      NewsModel newsModel = new NewsModel();
                                      newsModel.id =
                                          locationNewsList[index]["id"];
                                      newsModel.title =
                                          locationNewsList[index]["title"];
                                      newsModel.desc =
                                          locationNewsList[index]["content"];
                                      newsModel.location =
                                          locationNewsList[index]["location"];
                                      newsModel.date = reqDate;
                                      newsModel.time = final_req_time;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: InkWell(
                                          child: newsTile(
                                            locationNewsList[index]['title'],
                                            locationNewsList[index]['content'],
                                            context,
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        DetailedNews(
                                                  newsModel: newsModel,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }));
                          }
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
