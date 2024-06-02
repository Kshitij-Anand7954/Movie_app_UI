import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/movie_screen.dart';
import 'package:movies_app/widgets/ironman_section.dart';
import 'package:movies_app/widgets/movie_section.dart';
import 'package:movies_app/widgets/spiderman_section.dart';
import 'package:movies_app/widgets/thor_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  void _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Text(
          'Kshitij FanApp Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
             
              },
            ),
            // Add more menu items as needed.
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("Marvel FanApp"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 230,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("images/deadpool.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
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
              Tab(text: "All"),
              Tab(text: "Thor"),
              Tab(text: "Spider Man"),
              Tab(text: "Iron Man"),
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
