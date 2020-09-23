import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiDesignScreen extends StatefulWidget {
  @override
  _UiDesignScreenState createState() => _UiDesignScreenState();
}

class _UiDesignScreenState extends State<UiDesignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Container(
          margin: EdgeInsets.only(top: 50,right: 30,left: 30,bottom: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                      IconButton(icon:Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },),
                      Text('Our Product',style: TextStyle(fontWeight: FontWeight.w700),),
                      Text(':',style: TextStyle(fontWeight: FontWeight.w700),)
                    ],),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 30),
                    child: Text('Your choice',style: TextStyle(
                      fontSize: 22
                    ),),
                  ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: TextFormField(
                  style: TextStyle(
                      color: Color(0xff929292)
                  ),
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    hintText: 'Search products',
                    hintStyle: TextStyle(
                      color: Color(0xff929292),
                    ),
                    prefixIcon: Icon(Icons.search,color: Color(0xff929292)),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: new BorderSide(color: Colors.white70),
                    ),

                  ),
                ),
              ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('TopLights',style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.w600),),
                            SizedBox(height: 20,),
                            Text('Delivery time',style: TextStyle(
                              color: Colors.grey
                            ),),
                            SizedBox(height: 10,),
                            Text('15:30',style: TextStyle(
                              fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 20,),
                            Text('Our contact',style: TextStyle(
                                color: Colors.grey
                            ),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                  ),
                                  child: Center(
                                    child: Icon(Icons.call,color: Colors.white,),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.all(Radius.circular(16))
                                  ),
                                  child: Center(
                                    child: Icon(Icons.location_on,color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text('Filters',style: TextStyle(
                                color: Colors.grey
                            ),),
                            SizedBox(height: 10,),
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.compare_arrows,color: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Cold',style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.compare_arrows,color: Colors.white,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Warm',style: TextStyle(color: Colors.white),),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 368,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32))
                        ),
                        child: Column(
                          children: <Widget>[
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
