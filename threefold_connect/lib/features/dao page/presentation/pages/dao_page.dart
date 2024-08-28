import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/active_widget.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/executable_widget.dart';
import 'package:threefold_connect/theme/theme.dart';
import 'package:threefold_connect/widgets/app_bar.dart';

import '../../data/get_dao.dart';

class DaoPage extends StatefulWidget {
  const DaoPage({super.key});

  @override
  State<DaoPage> createState() => _DaoPageState();
}

class _DaoPageState extends State<DaoPage> {
  List<Proposal>? activeList = [];
  List<Proposal>? inactiveList = [];

  void setActiveList() async {
    final proposals = await getProposals();
    setState(() {
      activeList = proposals['activeProposals'];
      inactiveList = proposals['inactiveProposals'];
    });
  }

  @override
  void initState() {
    setActiveList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const MyAppBar(title: 'Dao'),
        body: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: TabBar(
                  labelColor: Theme.of(context).colorScheme.primary,
                  indicatorColor: Theme.of(context).colorScheme.primary,
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
                  // onChanged: filter
                  trailing: const <Widget>[
                    Icon(
                      Icons.search,
                      color: grey,
                    )
                  ],
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.secondary),
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
            Expanded(
              child: TabBarView(
                children: [
                  ActiveWidget(activeProposals: activeList),
                  ExecutableWidget(
                    inactiveProposals: inactiveList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
