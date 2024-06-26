import 'package:flutter/material.dart';
import 'package:pcic_mobile_app/screens/dashboard/_message.dart';
import 'package:pcic_mobile_app/screens/dashboard/_settings.dart';
import 'package:pcic_mobile_app/screens/dashboard/_task.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    TaskPage(),
    MessagesPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem('storage/images/home-2.png', 'Home', 0),
          _buildNavigationBarItem('storage/images/calendar-2.png', 'Tasks', 1),
          _buildNavigationBarItem('storage/images/message.png', 'Messages', 2),
          // _buildNavigationBarItem(Icons.settings, 'Settings', 3),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
    String icon,
    String label,
    int index,
  ) {
    final isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFF89C53F).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(icon),
              color: const Color(0xFF7C7C7C),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isSelected ? 1.0 : 0.0,
                child: Text(label,
                    style: const TextStyle(
                        color: Color(0xFF89C53F), fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
      ),
      label: '',
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w100)),
                  Text(
                    'Hi Agent!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(Icons.menu)
            ],
          ),
          const SizedBox(height: 16),
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF0F7D40),
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('storage/images/icon.png'),
                                height: 55,
                                width: 55,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Juan Dela Cruz',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Agent 007',
                                    style: TextStyle(
                                        color: Color(0xFFD2FFCB),
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Image(
                            image: AssetImage('storage/images/arrow-right.png'))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'storage/images/checked.png',
                            height: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Task Completed: 3',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'storage/images/list.png',
                            height: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Remaining Tasks: 4',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Divider(
                      color: Colors.white24,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Image.asset('storage/images/calendar-2.png'),
                            const SizedBox(width: 4),
                            const Text(
                              'Sunday, 5 March',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('storage/images/clock.png'),
                            const SizedBox(width: 4),
                            const Text(
                              '2972 Westheimer..',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                        // Row(),
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(height: 8),
          // Container(
          //   height: 85,
          //   decoration: const BoxDecoration(color: Colors.white),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             height: 65,
          //             width: 65,
          //             decoration: BoxDecoration(
          //                 color: const Color(0xFF7C7C7C).withOpacity(0.1),
          //                 shape: BoxShape.circle),
          //             child: Image.asset('storage/images/profile-add.png'),
          //           ),
          //           Text(
          //             '3',
          //           )
          //         ],
          //       ),
          //       // SizedBox(
          //       //   width: 65,
          //       // ),
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             height: 65,
          //             width: 65,
          //             decoration: BoxDecoration(
          //                 color: const Color(0xFF7C7C7C).withOpacity(0.1),
          //                 shape: BoxShape.circle),
          //             child: Image.asset('storage/images/hospital.png'),
          //           ),
          //           Text('4')
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF7C7C7C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Recent Task',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'storage/images/FormImage.png'),
                                      height: 55,
                                      width: 55,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Natural Disaster',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ID Number',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w100),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Divider(
                            color: const Color(0xFF7C7C7C).withOpacity(0.1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'storage/images/clock.png',
                                    color: const Color(0xFFC5C23F),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '03-23-24',
                                    style: TextStyle(color: Color(0xFFC5C23F)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'storage/images/clock.png',
                                    color: const Color(0xFF45C53F),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '04-25-24',
                                    style: TextStyle(color: Color(0xFF45C53F)),
                                  )
                                ],
                              )
                              // Row(),
                            ],
                          ),
                        )
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
