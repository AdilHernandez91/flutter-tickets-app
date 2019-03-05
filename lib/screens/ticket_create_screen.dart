import 'package:flutter/material.dart';

class TicketCreateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TicketCreateScreenState();
  }
}

class _TicketCreateScreenState extends State<TicketCreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  String _title;
  String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Ticket')),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 10.0,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildTitleField(),
                SizedBox(height: 20.0,),
                _buildDescriptionField(),
                SizedBox(height: 50.0,),
                _buildSubmitButton(),
              ],
            )
          )
        ),
      ),
    );
  }
  
  TextFormField _buildTitleField() {
    return TextFormField(
      autofocus: true,
      focusNode: _titleFocus,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Type ticket title',
        labelText: 'Title',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_descriptionFocus);
      },
      onSaved: (String value) {
        _title = value;
      },
    );
  }

  TextFormField _buildDescriptionField() {
    return TextFormField(
      autofocus: true,
      focusNode: _descriptionFocus,
      maxLines: 4,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Type ticket description',
        labelText: 'Description',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is required';
        }
      },
      onFieldSubmitted: (String value) {
        _descriptionFocus.unfocus();
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  Widget _buildSubmitButton() {
    return RaisedButton(
      child: Text('Create'),
      textColor: Colors.white,
      onPressed: () => _onSubmitForm,
    );
  }

  void _onSubmitForm() {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
  }
}