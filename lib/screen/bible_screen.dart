import 'package:flutter/material.dart';

class BibleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a verse...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual data
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Book $index'),
                    subtitle: Text('Chapter 1-10'),
                    onTap: () {
                      // Navigate to chapter view
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}