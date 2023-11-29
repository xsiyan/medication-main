import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication/firebase_options.dart';
import 'package:medication/global_bloc.dart';
import 'package:sizer/sizer.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // GlobalBloc? globalBloc;
  // // NewEntryBloc? newEntryBloc;

  // @override
  // void initState() {
  //   globalBloc = GlobalBloc();
  //   // newEntryBloc = NewEntryBloc();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: ThemeData(primarySwatch: Colors.lightBlue),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:medication/homepage.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'MediMate',
//       theme: ThemeData(),
//       home: const HomePage(),
//     ),
//   );
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//     );
//   }
// }

