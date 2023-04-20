import 'package:flutter/material.dart';

class PersonalizedLoginPage extends StatefulWidget {
  final List<Widget> items;
  final Color backgroundColor;
  final Color foregroundColor;
  

  PersonalizedLoginPage({Key? key,required this.items, this.backgroundColor = Colors.redAccent, this.foregroundColor = Colors.white, });

  @override
  State<PersonalizedLoginPage> createState() => _PersonalizedLoginPageState();
}

class _PersonalizedLoginPageState extends State<PersonalizedLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();

  }
}