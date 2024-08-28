import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/dao_card.dart';


// ignore: must_be_immutable
class ExecutableWidget extends StatefulWidget {
  List<Proposal>? inactiveProposals;
  ExecutableWidget({super.key , required this.inactiveProposals});

  @override
  State<ExecutableWidget> createState() => _ExecutableWidgetState();
}

class _ExecutableWidgetState extends State<ExecutableWidget> {
  List<Proposal>? inactiveProposals;
  @override
  void initState() {
    inactiveProposals = widget.inactiveProposals;
    super.initState();
  }


    @override
  void didUpdateWidget(covariant ExecutableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.inactiveProposals != oldWidget.inactiveProposals) {
      setState(() {
        inactiveProposals = widget.inactiveProposals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildDaoCardList(inactiveProposals) ?? [const Text('No active proposal at the moment')],
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
  