import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/ironman_section.dart';
import 'package:movies_app/widgets/movie_section.dart';
import 'package:movies_app/widgets/spiderman_section.dart';
import 'package:movies_app/widgets/thor_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
@override
  void initState() {
   _tabController=TabController(length: 4, vsync: this,initialIndex: 0);
   _tabController.addListener(_handelTabSection);
    super.initState();
  }

_handelTabSection(){
  if(_tabController.indexIsChanging){
    setState(() {
      
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Movie Streaming"),
        actions: [
          Padding(padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.search),)
        ],
      ),

      body: ListView(
        children: [
          CarouselSlider( options: CarouselOptions(
            autoPlay: true,
            height: 230,
            enlargeCenterPage: true,
            aspectRatio: 16/9,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage("images/deadpool.jpg"),
              fit: BoxFit.cover,
              )
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage("images/thor3.jpg"),
              fit: BoxFit.cover,
              )
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage("images/spiderman3.jpg"),
              fit: BoxFit.cover,
              )
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage("images/ironman3.jpg"),
              fit: BoxFit.cover,
              )
              ),
            ),
          ],
          ),
          SizedBox(height: 30),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            labelStyle: TextStyle(

              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,

            ),

            dividerHeight: 0,
            indicatorColor: Colors.redAccent,
            tabs: [
              Tab(text:"All"),
              Tab(text:"Thor"),
              Tab(text:"Spider Man"),
              Tab(text:"Iron Man"),
            ],

          ),
          SizedBox(height: 20),
          Center(
            child: [
              MoviesSection(),
              thorSection(),
              spidermanSection(),
              IronmanSection(),
            ][_tabController.index],
          ),
        ],
      ),
    );
  }
}