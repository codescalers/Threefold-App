import 'package:flutter/material.dart';
import 'package:three_fold_connect/features/dao%20page/presentation/widgets/active_widget.dart';
import 'package:three_fold_connect/theme/theme.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({super.key});

  @override
  State<DaoPage> createState() => _DaoPageState();
}

//To-Do: make the searchbar smaller 
class _DaoPageState extends State<DaoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            'Dao page',
            style: TextStyle(color: white, fontFamily: poppins),
          ),
          leading: Icon(Icons.menu),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: TabBar(
                labelColor: Theme.of(context).colorScheme.secondary,
                indicatorColor: Color(0xFF1AA18E), //TODO-->check malha
                unselectedLabelColor: white,
                dividerColor: Theme.of(context).scaffoldBackgroundColor,
                tabs: [
                  Tab(text: 'Active'),
                  Tab(text: 'Executable'),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(10), child :
            SearchBar(
              trailing: <Widget>[
                const Icon(
                  Icons.search,
                  color: grey,
                )
              ],
              backgroundColor: WidgetStateProperty.all<Color>(primaryColor),
              hintText: "Search by proposal description",
              hintStyle: WidgetStateProperty.all<TextStyle>(
                  TextStyle(color: grey, fontFamily: inter , fontSize: 14)),
              textStyle: WidgetStateProperty.all<TextStyle>(
                  TextStyle(color: grey, fontFamily: inter , fontSize: 14)),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ActiveWidget(),
                  Center(child: Text('Executable')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
