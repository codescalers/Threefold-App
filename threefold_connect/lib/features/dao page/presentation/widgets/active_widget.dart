import 'package:flutter/material.dart';
import 'package:threefold_connect/features/dao%20page/data/dao_card_model.dart';
import 'package:threefold_connect/features/dao%20page/data/dummy_data.dart';
import 'package:threefold_connect/features/dao%20page/presentation/widgets/dao_card.dart';


class ActiveWidget extends StatefulWidget {
  const ActiveWidget({super.key});

  @override
  State<ActiveWidget> createState() => _ActiveWidgetState();
}

class _ActiveWidgetState extends State<ActiveWidget> {
  List<DaoCardDetails> daoList=[];

  @override
  void initState() {
    // TODO: Fetch list an update it and remove this dummy data line
    daoList= daoDetailsList;   
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildDaoCardList(daoList),
        ),
      ),
    );
  }
}


List<DaoCard> _buildDaoCardList(List<DaoCardDetails> list) {
  return list.map((item) {
    return DaoCard(
      text: item.text,
      description: item.description,
      date: item.date,
    );
  }).toList();
}