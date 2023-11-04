import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'authenticaiton_feature/view/widgets/feature_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List featureList = [
    'Blood Search',
    'Blood Request',
    'Blood Banks',
    'Ambulance',
    'Hospitals',
    'Doctors',
    'Nurse',
    'Emergency',
    'Blog',
    'About',
  ];
  final List<IconData> iconlist = [
    Icons.search,
    Icons.add,
    Icons.home,
    Icons.local_taxi,
    Icons.local_hospital,
    Icons.person,
    Icons.woman,
    Icons.emergency,
    Icons.read_more,
    Icons.abc,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          title: const Text(
            'DashBoard',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          //leading: Icon(Icons.abc),
          actions: [
            SizedBox(width: 10.w),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.red.shade900),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.yellow,
                            child: Icon(Icons.person),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Antor Chakraborty',
                              style: TextStyle(fontSize: 20,color: Colors.white),
                            ),
                            Text(
                              '01863837120',
                              style: TextStyle(fontSize: 15,color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )),
                const ListTile(
                  title: Text('My Profile'),
                  leading: Icon(Icons.person),
                ),
                const ListTile(
                  title: Text('Donation Histoy'),
                  leading: Icon(Icons.local_hospital),
                ),
                const ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1),
            itemCount: 10,
            itemBuilder: (context, index) {
              return FeatureCard(iconData: 'icon$index.png',index: index,text:featureList[index] ,);
            },
          ),
        ),
      ),
    );
  }
}
