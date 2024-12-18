import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeleton extends StatelessWidget {
  const CustomSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      // Skeletonizer wraps the entire ListView to animate the loading effect
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25), 
                ),
              ),
              title: Container(
                width: double.infinity,
                height: 18.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              subtitle: Container(
                width: double.infinity * 0.6, 
                height: 12.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8), 
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
