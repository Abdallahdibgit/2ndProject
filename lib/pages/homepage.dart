import 'package:firstapplication/pages/selectedBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Book.dart';
import '../models/popular.dart';
import '../widgets/Tab-indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> fetchData() async {
    var url = 'https://abdallahdib.000webhostapp.com/BookLibrary.php';

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data.toString());
      } else {
        print('Failed to load data: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:25, top:25),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Text('Hello Customer ',
                    style:GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text('Discover Latest Book',
                    style:GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ],
              ),
              ),

            Container(
              height: 39,
              margin: EdgeInsets.only(left: 25, right:25 ,top:18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child:Stack(
                children:<Widget>[
                  TextField(
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color:Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 19, right:50, bottom: 8),
                      border: InputBorder.none,
                      hintText: 'Search book...',
                      hintStyle: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    right:0,
                    child:
                    SvgPicture.asset('assets/svg/system-search.svg'),
                  ),

                ],
              ),
            ),
            Container(
              height: 25,
              margin:EdgeInsets.only(top:30),
              padding:EdgeInsets.only(left: 25),
              child:DefaultTabController(
                length: 3,
                child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.openSans(
                      fontSize:14,
                      fontWeight: FontWeight.w600),
                    indicator:RoundedRectangleTabIndicator(
                      weight: 2,
                      width: 10,
                      color: Colors.black,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right:30),
                          child: Text('New'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right:30),
                          child: Text('Trending'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right:30),
                          child: Text('Best Seller'),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:21),
              height: 210,
              child: ListView.builder(
                padding: EdgeInsets.only(left:25, right: 6),
                  itemCount: newbooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                return Container(
                  height: 210,
                  width: 153,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: AssetImage(newbooks[index].imageUrl))
                  ),
                );
              }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:25, top:25),
              child:
                  Text('Popular ',
                    style:GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
              ),
            Container(
              child: ListView.builder(
                  padding: EdgeInsets.only(top:25, right:25, left:25),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: populars.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        print('ListView Tapped');
                        Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => SelectedBook(
                                  popularBookModel: populars[index]),
                        ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 19),
                        height: 81,
                        width: MediaQuery.of(context).size.width-50,
                        child:Row(
                          children: <Widget>[
                            Container(
                          height:81,
                          width: 62,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: AssetImage(populars[index].imageUrl))
                        ),
                      ),
                            SizedBox(width: 21),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  populars[index].title,
                                  style:GoogleFonts.openSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  populars[index].author,
                                  style:GoogleFonts.openSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color:Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$' + populars[index].price,
                                  style:GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
