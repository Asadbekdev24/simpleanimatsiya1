import 'package:flutter/material.dart';
import 'package:flutter_application_animation/star_animation.dart';

class MyListView extends StatelessWidget {
  // Sample data
  final List<Map<String, String>> books = [
    {
      'title': 'Atomic Habits',
      'subtitle': 'An Easy & Proven Way to Build Good Habits & Break Bad Ones',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/91bYsX41DVL.jpg'
    },
    {
      'title': 'Deep Work',
      'subtitle': 'Rules for Focused Success in a Distracted World',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/71TPda7cwUL.jpg'
    },
    {
      'title': 'The Pragmatic Programmer',
      'subtitle': 'Your Journey To Mastery',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/41as+WafrFL.jpg'
    },
    {
      'title': 'Clean Code',
      'subtitle': 'A Handbook of Agile Software Craftsmanship',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/51b7XbfMIIL.jpg'
    },
    {
      'title': 'The Alchemist',
      'subtitle': 'A Fable About Following Your Dream',
      'image':
          'https://images-na.ssl-images-amazon.com/images/I/71aFt4+OTOL.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final item = books[index];
                  return ListTile(
                    leading: Hero(
                      tag: "${item['image']}",
                      child: Image.network(
                        item['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(item['title']!),
                    subtitle: Text(item['subtitle']!),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(item: item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContainerAnimation(),
                      ));
                },
                child: Text("vazifa 2")),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['title']!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "${item['image']}",
                child: Image.network(
                  item['image']!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              item['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              item['subtitle']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
