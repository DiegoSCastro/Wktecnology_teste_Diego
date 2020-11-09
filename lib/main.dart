import 'package:avaliacao_wk_tecnology_crud/provider/user_provider.dart';
import 'package:avaliacao_wk_tecnology_crud/routes.dart';
import 'package:avaliacao_wk_tecnology_crud/views/home_page.dart';
import 'package:avaliacao_wk_tecnology_crud/views/register_page.dart';
import 'package:avaliacao_wk_tecnology_crud/views/update_page.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());

  await Parse().initialize(
    'NZI9zjd5QqWWcGSPF93yHvotxLV37yHNLXMLTCWs',
    'https://parseapi.back4app.com/',
    clientKey: 'u4s6Cn7W6gv5mYJIHEIyLdHBqZMLlaCwTrSlhjMS',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Routes.HOME: (_) => HomePage(),
          Routes.REGISTE_PAGE: (_) => RegisterPage(),
          Routes.UPDATE_PAGE: (_) => UpdatePage(),
        },
      ),
    );
  }
}
