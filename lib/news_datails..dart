import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mechine_test_accubits/ui_design.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {

  final String title;
  final String imageUrl;
  final String description;
  final String author;
  final String name;
  final String publishedAt;
  final String url;
  NewsDetails({
    Key key,
    this.title,
    this.imageUrl,
    this.description,
    this.author,
    this.name,
    this.publishedAt,
    this.url
}):super(key:key);
  createState(){
    return _NewsDetailsState(this.title,
        this.imageUrl,
        this.description,
        this.author,
        this.name,
        this.publishedAt,
        this.url);
  }
}

class _NewsDetailsState extends State<NewsDetails> {
  String title;
  String imageUrl;
  String description;
  String author;
  String name;
  String publishedAt;
  String url;
  _NewsDetailsState(
      this.title,
      this.imageUrl,
      this.description,
      this.author,
      this.name,
      this.publishedAt,
      this.url
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(height: 20,),
              Text(title,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Image.network(imageUrl),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(name),
                  //Text(publishedAt),
                  Text(publishedAt)
                ],
              ),
              SizedBox(height: 10,),
              Text(author,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text(description),
              SizedBox(height: 10,),
              InkWell(
                onTap: ()async{
                  if(await canLaunch(url)){
                  await launch(url);
                  }
                },
                  child: Text(url,style: TextStyle(color: Colors.blue),)),

              SizedBox(height: 50,),

              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>UiDesignScreen()
                    ));
                  },
                  child: Container(
                    color: Colors.grey,
                    height: 40,
                      width: 200,
                      child: Center(child: Text('UI DESIGN'))))

            ],
          ),
        ),
      ),
    );
  }
}
