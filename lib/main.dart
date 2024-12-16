import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final CarouselController _carouselController = CarouselController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Responsive Layout"),
        actions: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 768) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      drawer: Sidebar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ContainerBox(
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
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ContainerBox(
                          color: Colors.purple.shade100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/p1.jpg',
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
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ContainerBox(
                          color: Colors.blue.shade100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Adding a foreground overlay color
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Foreground overlay color
                                  borderRadius: BorderRadius.circular(8), // Optional for rounded corners
                                ),
                                child: CarouselSlider(
                                  items: [
                                    // Image 1 with description
                                    Stack(
                                      children: [
                                        Image.asset('assets/images/p1.jpg', fit: BoxFit.cover),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Text(
                                            'Description for Image 1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image 2 with description
                                    Stack(
                                      children: [
                                        Image.asset('assets/images/p2.jpeg', fit: BoxFit.cover),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Text(
                                            'Description for Image 2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image 3 with description
                                    Stack(
                                      children: [
                                        Image.asset('assets/images/p3.jpg', fit: BoxFit.cover),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Text(
                                            'Description for Image 3',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Image 4 with description
                                    Stack(
                                      children: [
                                        Image.asset('assets/images/p4.jpg', fit: BoxFit.cover),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Text(
                                            'Description for Image 4',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    viewportFraction: 1.0,
                                  ),
                                  carouselController: _carouselController,
                                ),
                              ),

                              // Left Arrow Button
                              Positioned(
                                left: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_left, size: 40),
                                  color: Colors.white, // Arrow color
                                  onPressed: () => _carouselController.previousPage(),
                                ),
                              ),

                              // Right Arrow Button
                              Positioned(
                                right: 10,
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_right, size: 40),
                                  color: Colors.white, // Arrow color
                                  onPressed: () => _carouselController.nextPage(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )



                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ContainerBox(
                          color: Colors.transparent, // Transparent to add gradient
                          child: Container(
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
                                    width: 150, // Round image size
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
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  ),
                                  child: const Text('Learn More'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: ContainerBox(
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
                                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                                      backgroundColor: Colors.lightGreenAccent, // Button color
                                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                      textStyle: TextStyle(fontSize: 16), // Custom text style
                                    ),
                                    child: Text('Button B'),
                                  ),
                                ],
                              ),)
                        ),
                      ),

                      SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: ContainerBox(
                          color: Colors.grey.shade300,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Adding a foreground overlay color
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3), // Foreground overlay color
                                borderRadius: BorderRadius.circular(8), // Optional for rounded corners
                              ),
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
                                carouselController: _carouselController,
                              ),
                            ),

                            // Left Arrow Button
                            Positioned(
                              left: 10,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_left, size: 40),
                                color: Colors.white, // Arrow color
                                onPressed: () => _carouselController.previousPage(),
                              ),
                            ),

                            // Right Arrow Button
                            Positioned(
                              right: 10,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_right, size: 40),
                                color: Colors.white, // Arrow color
                                onPressed: () => _carouselController.nextPage(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return MobileLayout();
          }
        },
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.blue.shade100,
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Services"),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
          ),
        ],
      ),
    );
  }
}

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
                  'assets/images/p1.jpg',
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
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
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
                    backgroundColor: Colors.lightGreenAccent, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 16), // Custom text style
                  ),
                  child: Text('Button B'),
                ),
              ],
            ),)
          ),
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
// Helper method to show the message box
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


// // ContainerBox widget for styling
// class ContainerBox extends StatelessWidget {
//   final Color color;
//   final Widget child;
//
//   const ContainerBox({
//     required this.color,
//     required this.child,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       color: color,
//       child: child,
//     );
//   }
// }
class ContainerBox extends StatelessWidget {
  final Color color;
  final String? text;
  final Widget? child;

  const ContainerBox({
    Key? key,
    required this.color,
    this.text,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child ??
          Center(
            child: Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
    );
  }
}

class CarouselWithArrows extends StatefulWidget {
  @override
  _CarouselWithArrowsState createState() => _CarouselWithArrowsState();
}

class _CarouselWithArrowsState extends State<CarouselWithArrows> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
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
        Positioned(
          left: 10,
          top: 150,
          child: IconButton(
            icon: const Icon(Icons.arrow_left, color: Colors.white, size: 30),
            onPressed: () {
              _controller.previousPage();
            },
          ),
        ),
        Positioned(
          right: 10,
          top: 150,
          child: IconButton(
            icon: const Icon(Icons.arrow_right, color: Colors.white, size: 30),
            onPressed: () {
              _controller.nextPage();
            },
          ),
        ),
      ],
    );
  }
}
