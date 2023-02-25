import 'package:flutter/material.dart';

class dashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
              labelText: 'Name',
              suffixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              labelText: 'password',
              suffixIcon: Icon(Icons.lock),
            ),
          )
        ],
      ),
    );
  }
}
