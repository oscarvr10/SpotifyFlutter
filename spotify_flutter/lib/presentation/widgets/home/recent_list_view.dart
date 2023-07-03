import 'package:flutter/material.dart';
import 'package:spotify_flutter/domain/entities/entities.dart';

class RecentListView extends StatelessWidget {
  final List<Recent> recentPlayedList;

  const RecentListView({
    super.key,
    required this.recentPlayedList,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodySmall!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(children: [
              _recentItem(recentPlayedList[0], titleStyle),
              _recentItem(recentPlayedList[2], titleStyle),
              _recentItem(recentPlayedList[4], titleStyle),
            ]),
          ),
          Expanded(
            child: Column(children: [
              _recentItem(recentPlayedList[1], titleStyle),
              _recentItem(recentPlayedList[3], titleStyle),
              _recentItem(recentPlayedList[5], titleStyle),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _recentItem(Recent recent, TextStyle textStyle) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => print('Tap on ${recent.description}'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.grey[900],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(6.0)),
                child: Image.network(
                  recent.imageUrl,
                  width: 60,
                  height: 60,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    recent.description,
                    maxLines: 2,
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
