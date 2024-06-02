import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class IronmanSection extends StatelessWidget {
List names=[
  "Iron Man 3",
  "Iron Man 2",
  "Iron Man",
 

];
List images=[

 "images/ironman3.jpg",
 "images/ironman2.jpg",
 "images/ironman1.jpg",
  
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider( options: CarouselOptions(
            autoPlay: true,
            height: 500,
            enlargeCenterPage: true,
            aspectRatio: 16/9,
            enableInfiniteScroll: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.65,
          ),
          items: [
           for(int i=0;i<images.length;i++)
            InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(images[i],
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text("PG-13",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,

                          ),
                          ),
                           Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              SizedBox(width: 5,),
                              Text("4.8",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                
                              ),
                              )
                            ],
                          ),
                          Text("Action",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,

                          ),
                          ),
                         
                      ],
                    )
                    ),
                    SizedBox(height: 5),
                    Text(names[i],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,


                    ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
          ),
      ],
    );
  }
}