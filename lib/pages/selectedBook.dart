import '/models/popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/Tab-indicator.dart';
import '/constants/colors.dart';

class SelectedBook extends StatelessWidget {
  const SelectedBook({super.key, required Popular popularBookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: FloatingActionButton(
          onPressed: (){},
          child: Text(
            'Add To Library',
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
           child: CustomScrollView(
             slivers: [
               SliverAppBar(
                 backgroundColor: AppColors.primaryColor,
                 expandedHeight: MediaQuery.of(context).size.height*0.5,
                 flexibleSpace: Container(
                   height: MediaQuery.of(context).size.height*0.5,
                   child: Stack(
                     children: [
                       Positioned(
                         left: 25,
                           top: 35,
                       child:GestureDetector(
                         onTap: (){
                           Navigator.pushReplacementNamed(
                               context, "/homePage");
                         },
                           child: Container(
                       width: 32,
                       height: 32,

                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                         color: Colors.white,
                       ),
                       child: SvgPicture.asset('assets/svg/back_arrow.svg'),
                       ),
                       ),
                       ),

                       Align(
                         alignment: Alignment.bottomCenter,
                         child: Container(
                           margin: EdgeInsets.only(bottom: 62),
                           width: 225,
                           height: 172,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             image: DecorationImage(
                               image: AssetImage('assets/images/MaybeNow.jpg'),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SliverList(delegate: SliverChildListDelegate(
                 [
                   Padding(
                     padding: EdgeInsets.only(top:24, left:25),
                     child: Text('Maybe Now',
                       style: GoogleFonts.openSans(
                         fontSize: 27,
                         color:Colors.black,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top:7, left:25),
                     child: Text('Colleen Hoover',
                       style: GoogleFonts.openSans(
                         fontSize: 14,
                         color:Colors.grey,
                         fontWeight: FontWeight.w400,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top:7, left:25),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Text('\$',
                       style: GoogleFonts.openSans(
                         fontSize: 14,
                         color:AppColors.primaryColor,
                         fontWeight: FontWeight.w600,
                       ),
                       ),
                     Text('20',
                       style: GoogleFonts.openSans(
                         fontSize: 32,
                         color:AppColors.primaryColor,
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                       ],
                     ),
                   ),
                   Container(
                     height: 28,
                     margin: EdgeInsets.only(top: 23, bottom: 36),
                     padding: EdgeInsets.only(left: 25),
                     child: DefaultTabController(
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
                             width: 30,
                             color: Colors.black,
                           ),
                           tabs: [
                             Tab(
                               child: Container(
                                 margin: EdgeInsets.only(right:39),
                                 child: Text('Description'),
                               ),
                             ),
                             Tab(
                               child: Container(
                                 margin: EdgeInsets.only(right:39),
                                 child: Text('Reviews'),
                               ),
                             ),
                             Tab(
                               child: Container(
                                 margin: EdgeInsets.only(right:39),
                                 child: Text('Similar'),
                               ),
                             ),
                           ]),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                     child: Text('"To Kill a Mockingbird" is a timeless novel written by Harper Lee. Set in the fictional town of Maycomb, Alabama, during the Great Depression, the story is narrated by Scout Finch, a young girl growing up in the racially charged American South. The novel explores themes of racial injustice, moral growth, and compassion. Atticus Finch, Scout father, is a principled lawyer defending Tom Robinson, a black man wrongly accused of raping a white woman. Through Scout innocent eyes, readers witness the profound impact of racial prejudice on individuals and the community. The narrative skillfully weaves together the coming-of-age story of Scout, her brother Jem, and their friend Dill with a courtroom drama that challenges societal norms. "To Kill a Mockingbird" is celebrated for its poignant portrayal of empathy and the fight against injustice, making it a classic and a powerful exploration of human nature.',
                     style: GoogleFonts.openSans(
                       fontSize: 12,
                       fontWeight: FontWeight.w400,
                       color:Colors.black,
                       letterSpacing: 1.5,
                       height: 2,
                     ),
                     ),
                   ),
                 ],
               ),
               ),
             ],
           ),
        ),
      ),
    );
  }
}
