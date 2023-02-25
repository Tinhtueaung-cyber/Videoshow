import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {

  Future<List<String>> _fetchVideoList() async {
    final response = await http.get(Uri.parse('http://192.168.100.194:3000/api/videos'));
    if (response.statusCode == 200) {
      List<dynamic> videosJson = jsonDecode(response.body);
      List<String> videos = videosJson.map((video) => video['name']).cast<String>().toList();
      return videos;
    } else {
      throw Exception('Failed to fetch videos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List'),
      ),
      body: FutureBuilder<List<String>>(
        future: _fetchVideoList(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            List<String> videos = snapshot.data!;
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(videos[index]),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching videos'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
