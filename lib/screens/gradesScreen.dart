import 'package:flutter/material.dart';
import '../services/CustomAppBar.dart';
import '../services/courses.dart';
import 'detailedCourseScreen.dart';

class GradesScreen extends StatelessWidget {
  final Courses coursesData = Courses(); // Create an instance of the Courses class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the list for margins
        child: ListView.builder(
          itemCount: coursesData.courses.length,
          itemBuilder: (context, index) {
            Course course = coursesData.courses[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0), // Space between cards
              decoration: BoxDecoration(
                color: Colors.white, // Card background color
                borderRadius: BorderRadius.circular(15.0), // Card border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Shadow with some opacity
                    blurRadius: 6,
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding inside the card
                leading: CircleAvatar(
                  backgroundImage: AssetImage(course.iconName), // Replace with a proper image
                  backgroundColor: Colors.transparent,
                ),
                title: Text(course.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.0),
                    Text(course.grade),
                    SizedBox(height: 4.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: course.progress,
                        backgroundColor: course.color.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(course.color),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(classes: course.classes),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
