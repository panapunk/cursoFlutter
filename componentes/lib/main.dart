
import 'package:flutter/material.dart';

import 'package:componentes/src/router/routes.dart';
import 'package:componentes/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

        return MaterialPageRoute( 
          builder: ( BuildContext context ) => AlertPage(),
        ); 

      },

      );
  }

}