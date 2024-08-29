import 'package:flutter/material.dart';
import 'package:tfchain_client/models/dao.dart';
import 'package:threefold_connect/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/get_proposal_votes.dart';
import 'show_result_dialog.dart';
import 'vote_dialog.dart';

class DaoCard extends StatefulWidget {
  final Proposal proposal;

  const DaoCard({
    required this.proposal,
    super.key,
  });

  @override
  State<DaoCard> createState() => _DaoCardState();
}

class _DaoCardState extends State<DaoCard> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _launchUrl() async {
    if (widget.proposal.link != "")  {
      final Uri url = Uri.parse(widget.proposal.link);
      if (!await launchUrl(url)) {
        const SnackBar(
          content: Text(
              "Can't go to proposal at this moment please try again later"),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.proposal.action,
              style: TextStyle(
                color: white,
                fontFamily: interBold,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const Divider(
            thickness: 2,
            color: grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.proposal.description,
              style: TextStyle(
                color: white,
                fontFamily: inter,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: TextButton(
              onPressed: _launchUrl,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                side: const BorderSide(
                  color: tertiaryColor,
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Go to proposal',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontFamily: interBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can vote until :',
                style: TextStyle(
                  color: white,
                  fontFamily: interBold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.proposal.end.formatDateTime(),
                style: TextStyle(
                  color: white,
                  fontFamily: inter,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: TextButton(
                  onPressed: () async {
                    final votes = await getProposalVotes(widget.proposal.hash);
                    // ignore: use_build_context_synchronously
                    showDialog(
                        context: context,
                        builder: (_) => ShowResultDialog(
                              totalVotes: votes.ayes.length + votes.nays.length,
                              noVotes: votes.nays.length,
                              yesVotes: votes.ayes.length,
                              threshold: votes.threshold,
                            ));
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Show result',
                      style: TextStyle(
                        color: white,
                        fontFamily: interBold,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => VoteDialog(
                            proposal: widget.proposal,
                          ));
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Vote',
                    style: TextStyle(
                      color: white,
                      fontFamily: interBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
