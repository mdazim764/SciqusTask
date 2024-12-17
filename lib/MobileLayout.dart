import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ResponsiveLayout.dart';

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container 1 (Image Carousel)
          ContainerBox(
            color: Colors.red.shade100,
            child: CarouselSlider(
              items: [
                Image.asset('assets/images/p1.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/p2.jpeg', fit: BoxFit.cover),
                Image.asset('assets/images/p3.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/p4.jpg', fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                viewportFraction: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Container 2 (Image with Description)
          ContainerBox(
            color: Colors.purple.shade100,
            child: Container(
              width: double.infinity, // Ensures full width
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/p5.jpg',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This is a description for the image.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Container 3 (Slider with Arrows)
          ContainerBox(
            color: Colors.blue.shade100,
            text: "Container 3 (Slider with Arrows)",
            child: CarouselWithArrows(),
          ),
          const SizedBox(height: 8),

          // Container 4 (Text Content)
          ContainerBox(
            color: Colors.transparent,
            child: Container(
              width: double.infinity, // Ensures full width
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade200, Colors.teal.shade500],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal.shade700, width: 2),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/p2.jpeg', // Replace with your image
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Explore More with Our Services!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Image Details"),
                            content: Text(
                              "This is an extended description for the image, showcasing its details and importance. You can add any specific content here!",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Text('Learn More'),
                  ),
                ],
              ),
            ),
          ),

          // Container 5 (custom Buttons)
          ContainerBox(
              color: Colors.transparent,
              child: Container(
                width: double.infinity, // Ensures full width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade200, Colors.orange.shade500],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade700, width: 2),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Custom Button 1
                    ElevatedButton(
                      onPressed: () {
                        _showMessageBox(context, "Custom Button A clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Button color
                        padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(fontSize: 16), // Custom text style
                      ),
                      child: Text('Button A'),
                    ),
                    const SizedBox(height: 8), // Space between buttons
                    // Custom Button 2
                    ElevatedButton(
                      onPressed: () {
                        _showMessageBox(context, "Custom Button B clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.lightGreenAccent, // Button color
                        padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(fontSize: 16), // Custom text style
                      ),
                      child: Text('Button B'),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 8),

          // Container 6 (Footer)
          ContainerBox(
            text: "Container 6 (Slider with Arrows)",
            color: Colors.grey.shade300,
            child: CarouselWithArrows(),
          ),
        ],
      ),
    );
  }
}


void _showMessageBox(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Button Clicked"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Close"),
          ),
        ],
      );
    },
  );
}
