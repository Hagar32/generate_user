import 'package:flutter/material.dart';
import 'package:generate_user/data/models/generate_user_model.dart';
import 'package:generate_user/data/remote_ds.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? _user;
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    final user = await UserDataSourceImpl().getRandomUser();
    setState(() {
      _user = user;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Random User'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: _user == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_user!.data['picture']['large']),
              ),
              title: Text(
                '${_user!.data['name']['first']} ${_user!.data['name']['last']}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _user!.data['email'],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Location:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Street: ${_user!.data['location']['street']['name']}, ${_user!.data['location']['street']['number']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'City: ${_user!.data['location']['city']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'State: ${_user!.data['location']['state']}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Country: ${_user!.data['location']['country']}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Spacer(),
            Center(
              child: MaterialButton(
                color: Colors.purple[100],
                clipBehavior: Clip.hardEdge,
                onPressed:(){
                  _getUser();
    setState(() {

    });
    },
                child: Text('Get Another User'),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
