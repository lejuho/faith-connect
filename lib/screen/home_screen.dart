import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

class HomeScreen extends StatelessWidget {

  final dio = Dio();

  // 실제 API 호출 함수
  Future<Map<String,String>> fetchDailyVerse() async {
    try {
      final response = await dio.get('https://ibibles.net/quote.php?kor-ge/1:10'); // 실제 API URL

      if (response.statusCode == 200) {
        print("worked!");
        final document = parse(response.data);
        final verse = document.body?.text ?? '';  // 본문 내용 추출
        final reference = document.querySelector('small')?.text ?? '';  // 절 부분 추출

        return {
          'verse': verse.trim(),
          'reference': reference.trim(),
        };
      }
      else {
        throw Exception('Failed to load daily verse');
      }
    } catch (e) {
      // 오류가 발생했을 때
      print("error");
      throw Exception('Error occurred while fetching the verse: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        // Daily Verse Section
        FutureBuilder<Map<String, String>>(
          future: fetchDailyVerse(), // API 호출
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 구절',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      CircularProgressIndicator(color: Colors.white),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 구절',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '네트워크 오류입니다: ${snapshot.error}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              final verse = snapshot.data!['verse']!;
              final reference = snapshot.data!['reference']!;

              return Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 구절',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        verse,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        SizedBox(height: 16),
          // Today's Reading Plan
          Text(
            '이어서 보기',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '요한복음',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            '3:1-21',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('읽기'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        width: 335,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Container(
                        width: 335 * 0.45,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '45%',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // Prayer Requests
          Text(
            'Prayer Requests',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          'https://creatie.ai/ai/api/search-image?query=A%20professional%20headshot%20of%20a%20middle-aged%20woman%20with%20glasses%20and%20a%20kind%20expression,%20wearing%20business%20casual%20attire%20against%20a%20light%20neutral%20background&width=32&height=32&orientation=squarish&flag=58095389-11c4-43b4-a062-e526f04c5712',
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emily Thompson',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2 hours ago',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Please pray for my mother\'s upcoming surgery next week. We\'re hoping for a successful procedure and quick recovery.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.personPraying, size: 14),
                            SizedBox(width: 4),
                            Text('Pray (24)'),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey,
                        ),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.comment, size: 14),
                            SizedBox(width: 4),
                            Text('Comment (8)'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // Study Groups
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Study Groups',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFD4C7FF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.users,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Women\'s Bible Study',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Next meeting: Tomorrow 7PM',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: FaIcon(FontAwesomeIcons.chevronRight),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }