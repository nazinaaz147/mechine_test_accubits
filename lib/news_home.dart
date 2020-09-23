import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';
import 'package:mechine_test_accubits/news_datails..dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  bool isLoading = false;
  List newsList = [];

  void initState(){
    super.initState();
   callFunction();
  }

  callFunction()async {
    setState(() {
      isLoading = true;
    });
 await   getList();
    setState(() {
      isLoading = false;
    });
  }

 Future<int> getList()async{
    String url = 'http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=aa67d8d98c8e4ad1b4f16dbd5f3be348';
    var nfa = await http.get(url).then((http.Response response) async {
      print(response.statusCode);
      int statusCode = response.statusCode;

      if (statusCode == 200) {
        var jsonData = json.decode(response.body);
        setState(() {
          newsList = jsonData['articles'];
        });
      }
      return response.statusCode;
    });
    print(newsList);
    print(newsList[0]['source']['name']);
    return nfa;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:isLoading? Shimmer.fromColors(
          baseColor: Colors.blueGrey,
          highlightColor: Colors.grey,
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    height: 150,
                    //width: MediaQuery.of(context).size.width*(1.9/3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 60,
                    //width: MediaQuery.of(context).size.width * (1.3/ 3),
                    margin: EdgeInsets.only(left: 15,right: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                  ),
                ],
              );
            },
          ),
        ):ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 30,
            ),
          itemCount:newsList == null ? 0 : newsList.length,
            itemBuilder: (BuildContext context,int i){
              return Container(
                height: 350,
                margin: EdgeInsets.only(left: 15,right: 15,top:25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(newsList[i]['title'] ??'Not Available',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        //height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: newsList[i]['urlToImage'] == null
                            ?Image.asset('assets/images/placeholder.png')
                            :Image.network(newsList[i]['urlToImage'],fit: BoxFit.fill, ),
                      ),
                    ),


                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(newsList[i]['source']['name'] ??'Not Available'),
                          Text(newsList[i]['publishedAt'])
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                        child: Text(newsList[i]['author']??'Not Available',
                        style: TextStyle(color: Colors.redAccent,
                        fontWeight: FontWeight.w600),)),
                    Expanded(
                        flex: 3,
                        child: Text(newsList[i]['description']??'Not Available',maxLines: 2,)),
                    Container(
                      alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>NewsDetails(
                                title:newsList[i]['title'] ??'Not Available' ,
                                imageUrl:newsList[i]['urlToImage'] ,
                                description: newsList[i]['description']??'Not Available',
                                author: newsList[i]['author']??'Not Available',
                                name:newsList[i]['source']['name'] ,
                                publishedAt:newsList[i]['publishedAt'] ,
                                url: newsList[i]['url']
                              )
                            )
                            );
                          },
                            child: Text('....Read more',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                            ),))),

                    Expanded(
                   flex: 3,
                   child: InkWell(
                          onTap: ()async{
                            if(await canLaunch(newsList[i]['url'])){
                              await launch(newsList[i]['url']);
                            }
                          },
                            child: Text(newsList[i]['url']??'Not Available',
                              maxLines: 2,
                              style:TextStyle(color: Colors.blue) ,)),
                 ),



                  ],
                ),
              );
            }),
      ),
    );
  }
}
