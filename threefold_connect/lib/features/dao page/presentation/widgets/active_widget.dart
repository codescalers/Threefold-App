import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';

import 'dao_card.dart';

class ActiveWidget extends StatefulWidget {
  List<Proposal>? activeProposals;
  ActiveWidget({super.key, required this.activeProposals});

  @override
  State<ActiveWidget> createState() => _ActiveWidgetState();
}

class _ActiveWidgetState extends State<ActiveWidget> {
  List<Proposal>? activeProposals=[];

  @override
  void initState() {
    activeProposals = widget.activeProposals;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ActiveWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeProposals != oldWidget.activeProposals) {
      setState(() {
        activeProposals = widget.activeProposals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildDaoCardList(activeProposals) ??
              [const Text('No active proposal at the moment')],
        ),
      ),
    );
  }
}

List<DaoCard>? _buildDaoCardList(List<Proposal>? list) {
  return list?.map((item) {
    return DaoCard(
      proposal: item,
    );
  }).toList();
}
