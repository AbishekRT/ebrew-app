import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: "Name")),
            DropdownButtonFormField(
              items:
                  ['Male', 'Female', 'Other']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
              onChanged: (_) {},
              decoration: InputDecoration(labelText: "Gender"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
              keyboardType: TextInputType.phone,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
