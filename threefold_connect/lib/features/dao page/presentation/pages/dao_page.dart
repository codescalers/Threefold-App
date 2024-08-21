import 'package:flutter/material.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/active_widget.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/executable_widget.dart';
import 'package:threefold_connect/theme/theme.dart';
import 'package:threefold_connect/widgets/app_bar.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({super.key});

  @override
  State<DaoPage> createState() => _DaoPageState();
}

//TODO : Executable page
class _DaoPageState extends State<DaoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MyAppBar( title: 'Dao page'), 
        body: Column(
          children: [
            PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: TabBar(
                labelColor: Theme.of(context).colorScheme.primary,
                indicatorColor: primaryColor, 
                unselectedLabelColor: white,
                dividerColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: const [
                  Tab(text: 'Active'),
                  Tab(text: 'Executable'),
                ],
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 40,
                child: SearchBar(
                  trailing: const <Widget>[
                    Icon(
                      Icons.search,
                      color: grey,
                    )
                  ],
                  backgroundColor: MaterialStateProperty.all<Color>(secondryColor),
                  hintText: "Search by proposal description",
                  hintStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(color: grey, fontFamily: inter, fontSize: 14)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(color: grey, fontFamily: inter, fontSize: 14)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ActiveWidget(),
                  ExecutableWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
