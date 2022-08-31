import 'package:flutter/material.dart';
import 'package:flutterparallax/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Vincent\nVan Gogh',
                    style: TextStyle(
                        color: Colors.white, fontSize: 50, letterSpacing: 2),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '30 March 1853-29 July 1890',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Vincent Willem van Gogh was a Dutch post-impressionist painter who posthumously became one of the most famous and influential figures in the history of Western art.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text('Highlights painting',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
                Container(
                  height: 300,


                  padding: EdgeInsets.only(bottom: 30),
                  child: PageView.builder(
                      itemCount: paintings.length,
                      controller: pageController,
                      itemBuilder: (context, i) {
                        return Transform.scale(
                            scale: 1,
                            child: Container(





                              padding: EdgeInsets.only(right: 20.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 3
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    ),
                                    child: ClipRRect(

                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        paintings[i]['image'],
                                        height: 370,
                                        fit: BoxFit.cover,
                                        alignment:  Alignment(-pageOffset.abs() + i, 0),

                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      left: 10,
                                      bottom: 20,
                                      right: 10,
                                      child: Text(
                                        paintings[i]['name'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ))
                                ],
                              ),
                            ));
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
