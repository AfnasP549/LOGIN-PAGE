import 'package:flutter/material.dart';
import 'package:my_login_project/Chat.dart';
import 'package:my_login_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('List'),
        backgroundColor: Colors.green[300],
        actions: [
          IconButton(
            onPressed: () {
              _showLogoutDialog(context);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            if (index % 2 == 0) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return Chat(index: index);
                      },
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 23,
                  backgroundImage:
                      AssetImage('assets/images/circle.png'), 
                ),
                title: Text(
                  'Person $index',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'message $index',
                ),
                trailing: Text('1$index:00 pm'),
              );
            } else {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return Chat(
                          index: index,
                        );
                      },
                    ),
                  );
                },
                leading: ClipRRect(
                   
                    child: Image.asset(
                  'assets/images/square.jpeg', 
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )),
                title: Text(
                  'Person $index',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'message $index',
                ),
                trailing: Text('1$index:00 pm'),
              );
            }
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 10,
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                setLogin();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) {
                    return Login();
                  },
                ));
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> setLogin() async {
    final shr = await SharedPreferences.getInstance();
    final v = await shr.setBool('login', false);
    return v;
  }
}
