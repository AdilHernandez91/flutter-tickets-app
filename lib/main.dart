import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:tickets_app/scoped-models/ticket_model.dart';
import 'package:tickets_app/screens/home_screen.dart';
import 'package:tickets_app/screens/profile_screen.dart';
import 'package:tickets_app/screens/ticket_create_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TicketModel _model = TicketModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<TicketModel>(
      model: _model,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          buttonColor: Theme.of(context).primaryColor,
        ),
        initialRoute: 'Home',
        routes: {
          'Home': (BuildContext context) => HomeScreen(),
          'TicketCreate': (BuildContext context) => TicketCreateScreen(),
          'Profile': (BuildContext context) => ProfileScreen(),
        },
      ),
    );
  }
}