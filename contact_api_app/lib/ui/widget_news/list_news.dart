import 'package:contact_api_app/bloc/news/news_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/web_view_container_news.dart';

class ListNews extends StatelessWidget{
  final NewsState newsState;

  const ListNews({Key? key, required this.newsState}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              scrollDirection: Axis.vertical,
                  itemCount: newsState.news==null||newsState.news["articles"]==null?0:newsState.news["articles"].length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: Colors.brown,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WebViewContainerNews(newsState.news["articles"][index]["title"],newsState.news["articles"][index]["url"]))
                          );},

                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          children:[
                                            Text(newsState.news["articles"][index]["publishedAt"].toString().substring(0,10),
                                              style: const TextStyle(color: Colors.brown,fontFamily: "fantasy", fontWeight: FontWeight.bold),),
                                            const SizedBox(width: 30,),

                                            Text("h : "+newsState.news["articles"][index]["publishedAt"].toString().substring(12,16),
                                              style: const TextStyle(color: Colors.black87,fontFamily: "fantasy", fontWeight: FontWeight.bold),),

                                          ]),
                                      const SizedBox(height: 8),
                                      Text(newsState.news["articles"][index]["title"],
                                        maxLines: 3,textAlign:
                                        TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontFamily: "sans-serif"),),
                                    ],),
                                )
                            ),
                            Container(
                              child: Image(
                                image: newsState.news["articles"][index]["urlToImage"]==null?const NetworkImage("https://zupimages.net/viewer.php?id=22/14/tdt5.jpg"):NetworkImage(newsState.news["articles"][index]["urlToImage"]),
                                width: 150,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),],
                        ),
                      ),
                    );
                  },
    );
          }
  }