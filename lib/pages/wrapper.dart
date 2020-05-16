import 'package:flutter/material.dart';
import 'package:price/models/profile.dart';
import 'package:price/pages/authenticate/authenticate.dart';

import 'package:provider/provider.dart';


import 'authenticate/register_page.dart';
import 'authenticate/sign_in_page.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
