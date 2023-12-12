import 'package:flutter/material.dart';

import '../../Utils/Colors.dart';

class IssueTrackerScreen extends StatelessWidget {
  const IssueTrackerScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).size.height * 0.28;
    const double double60 = 60.0;
    const double double24 = 24.0;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),

          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: topPadding,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(double60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: double60, left: double24),
                  child: Column(
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: double24,
                            backgroundImage: NetworkImage(
                                    'https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg'),
                            backgroundColor: Colors.white,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Good Day',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white)),
                                Text('Mohammad Joynul Abedin Shokal',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),


                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      const Text('Explore Today\'s Issues',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: topPadding,
            left: MediaQuery.of(context).size.width / 2,
            child: Container(
              height: 100,
              transformAlignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
            top: topPadding,
            left: MediaQuery.of(context).size.width / 2,
            child: ClipRRect(
              borderRadius:  const BorderRadius.only(
                topRight: Radius.circular(double60),
              ),
              child: Container(
                height: 100,
                transformAlignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2, left:double24, right: double24),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const IssueItem();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor.withOpacity(0.2),
        onPressed: () {},
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}

class IssueItem extends StatelessWidget {
  const IssueItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Fix electricity issue in flat B6',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.red,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child:
                  const Text('High', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        subtitle: const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('House: 118/2, Flat: B6.', style: TextStyle(fontSize: 14)),
              Text(
                  'Lorem ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(fontSize: 12)),
              Text('Assigned to: John Doe', style: TextStyle(fontSize: 8)),
            ],
          ),
        ),
      ),
    );
  }
}
