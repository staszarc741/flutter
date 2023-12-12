import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading; // Add this property
  final VoidCallback? onBackButtonPressed;

  CustomAppBar({
    required this.title,
    this.automaticallyImplyLeading = false, 
    this.onBackButtonPressed, 
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the current theme's color scheme
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.background, // Set the background color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: colorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent, // Make AppBar background transparent
          elevation: 0, // Remove default elevation
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: automaticallyImplyLeading
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: onBackButtonPressed,
                )
              : null, // Use the property here
          actions: [
            IconButton(
              icon: Image.asset('assets/avatar_2.png'),
              onPressed: () {
                // TODO: Implement profile action
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
