import 'package:flutter/material.dart';

GoToPaget(BuildContext context, Widget page) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
