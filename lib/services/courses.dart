import 'package:flutter/material.dart';

class Class {
  final String title;
  final String professor;
  final String time;
  final DateTime date;

  Class({
    required this.title,
    required this.professor,
    required this.time,
    required this.date,
  });
}

class Course {
  final String name;
  final String grade;
  final Color color;
  final String iconName;
  final List<Class> classes;
  final double progress;

  Course({
    required this.name,
    required this.grade,
    required this.color,
    required this.iconName,
    required this.classes,
     required this.progress,
  });
}

class Courses {
  final List<Course> courses = [
    Course(
      name: "Literature",
      grade: "75/100",
      color: Colors.deepPurple,
      iconName: "assets/1.png",
      progress: 0.75,
      classes: [
        Class(
          title: "Literature Class 1",
          professor: "Prof. Smith",
          time: "19:00 - 20:30",
          date: DateTime(2023, 11, 13), // Use DateTime for date
        ),
        Class(
          title: "Literature Class 2",
          professor: "Prof. Smith",
          time: "11:00 - 12:30",
          date: DateTime(2023, 12, 14), // Use DateTime for date
        ),
      ],
    ),
    Course(
      name: "Science",
      grade: "88/100",
      color: Colors.deepPurple[300]!,
      iconName: "assets/2.png",
      progress: 0.88,
      classes: [
        Class(
          title: "Science Class 1",
          professor: "Prof. Johnson",
          time: "16:00 - 17:30",
          date: DateTime(2023, 12, 13), // Use DateTime for date
        ),
        Class(
          title: "Science Class 2",
          professor: "Prof. Johnson",
          time: "11:00 - 12:30",
          date: DateTime(2023, 12, 14), // Use DateTime for date

        ),
      ],
    ),
    // Add more courses with classes and corresponding details
  ];
}
