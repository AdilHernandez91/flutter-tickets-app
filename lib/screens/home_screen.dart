import 'package:flutter/material.dart';

import 'package:tickets_app/screens/ticket_create_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButton: _buildFloatingButton(context),
      body: Container(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Tickets'),
      actions: <Widget>[
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.account_circle),
          onPressed: () => Navigator.pushNamed(context, 'Profile'),
        )
      ],
    );
  }

  FloatingActionButton _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => TicketCreateScreen(),
        ));
      }
    );
  }
}