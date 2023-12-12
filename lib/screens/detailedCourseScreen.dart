import 'package:flutter/material.dart';
import '../services/CustomAppBar.dart';
import '../services/courses.dart';

class CourseDetailScreen extends StatelessWidget {
  final List<Class> classes;

  CourseDetailScreen({required this.classes});

  String formatSuperscriptDate(DateTime date) {
    final months = [
      'Січ', 'Лют', 'Бер', 'Кві', 'Тра', 'Чер', 'Лип', 'Сер', 'Вер', 'Жов', 'Лис', 'Гру'
    ];
    final month = months[date.month - 1];
    final day = date.day;
    return '$month $day';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Course Details',
        automaticallyImplyLeading: true,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final Class classInfo = classes[index];
            final bool isFirstClass = index == 0;

            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Card background color
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                ),
                
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      classInfo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: isFirstClass ? 24.0 : 18.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.date_range,
                        color: isFirstClass ? Colors.black : Colors.grey,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        formatSuperscriptDate(classInfo.date),
                        style: TextStyle(fontSize: 14, color: isFirstClass ? Colors.black : Colors.grey),
                      ),
                      SizedBox(width: 16.0),
                      Icon(
                        Icons.access_time,
                        color: isFirstClass ? Colors.black : Colors.grey,
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        '${classInfo.time}',
                        style: TextStyle(fontSize: 14, color: isFirstClass ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(height: 8.0),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Professor: ',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(width: 10.0),
                        Image.asset(
                          'assets/teacher_1.png',
                          width: 24.0, // Adjust the width as needed
                          height: 24.0, // Adjust the height as needed
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '${classInfo.professor}',
                          style: TextStyle(fontSize: 12, color: isFirstClass ? Colors.black : Colors.grey),
                        ),
                      ],
                   )
                  
                    // if (isFirstClass)
                    //   Container(
                    //     alignment: Alignment.centerRight,
                    //     child: Image.asset(
                    //       'assets/infographic_image.png',
                    //       width: 80.0,
                    //       height: 80.0,
                    //     ),
                    //   ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
