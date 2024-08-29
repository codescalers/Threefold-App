import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';
import 'package:threefold_connect/theme/theme.dart';
import 'package:threefold_connect/widgets/app_bar.dart';
import '../../data/get_dao_proposals.dart';
import '../widgets/active_executable_widget.dart';

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
            Expanded(
              child: TabBarView(
                children: [
                  ActiveOrExecutableWidget(proposals: activeList),
                  ActiveOrExecutableWidget(
                    proposals: inactiveList,
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
