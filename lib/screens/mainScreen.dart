import 'package:flutter/material.dart';
import 'gradesScreen.dart';
import 'scheduleScreen.dart';
import 'subjectsScreen.dart';
 import '../services/CustomAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ClassAnnouncementScreen(), // This will be your new custom screen
    GradesScreen(),
    ScheduleScreen(),
    SubjectsScreen(),
  ];
  final List<String> _titles = ['Головна', 'Оцінки', 'Розклад', 'Предмети'];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      title: _titles[_currentIndex], // This will change the title dynamically

      automaticallyImplyLeading: false,
    ),
    body: _screens[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/home.svg', width: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/reconciliation.svg', width: 24),
          label: 'Grades',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/calendar.svg', width: 24),
          label: 'Schedule',
        )
      ],
    ),
  );
}

void _onItemTapped(int index) {
  setState(() {
    _currentIndex = index;
  });
} 
}



class NewsMessageCard extends StatelessWidget {
  final String avatarUrl;
  final String messageTheme;
  final String messageTime;
  final String messageContent;

  const NewsMessageCard({
    Key key = const Key('NewsMessageCard'),
    this.avatarUrl = '',
    this.messageTheme = ' ',
    this.messageTime = ' ',
    this.messageContent = ' ',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: <Widget>[
        SizedBox(height: 30), 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Новини:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Dark teal text color
            ),
          ),
        ),
        SizedBox(height: 5), 
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.all(16),
          elevation: 2, // Adjust the elevation to match your design
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatarUrl), // Load avatar image
                    radius: 20, // Adjust the size to fit your design
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageTheme,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // Adjust the font size to fit your design
                          ),
                        ),
                        Text(
                          messageTime,
                          style: TextStyle(
                            color: Colors.grey, // Use a softer color for the time
                            fontSize: 12, // Smaller font size for the time
                          ),
                        ),
                        SizedBox(height: 8), // Space between time and content
                        Text(
                          messageContent,
                          style: TextStyle(
                            fontSize: 14, // Adjust the font size to fit your design
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ClassAnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 30), // This pushes the text lower from the top
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Пари Сьогодні:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Dark teal text color
            ),
          ),
        ),
        SizedBox(height: 4), // Spacing between the title and the card
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.all(16),
          child: Container(
 
            decoration: BoxDecoration(
              color: Color.fromARGB(107, 182, 116, 1), // Card background color
                borderRadius: BorderRadius.circular(15.0), // Card border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow with some opacity
                    blurRadius: 6,
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '• Через 2 Години',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white, 
                              ),
                            ),
                            Text(
                              'Математичний Аналіз',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, 
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Text(
                              'Тема: Функція. Границя функції.',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            )

                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/class_img.png', // Make sure to add the downloaded image to your assets folder
                        width: 175,
                        height: 175,
                      ),
                    ],
                  ),
              
                  
 
                ],
              ),
            ),
          ),
        ),
        NewsMessageCard(
          avatarUrl: 'assets/teacher_1.png', // Replace with your asset or network image
          messageTheme: 'Магістерська робота',
          messageTime: '5 днів назад',
          messageContent: 'Не забудьте, завтра останній день подання магістерських робіт!',
        ),
      ],
    );
  }
}





