import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
            )
          ],
          )
        ],
      ),
    );
  }
}