import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PlayerFullScreen extends StatefulWidget {
  const PlayerFullScreen({
    Key? key,
    required this.closeOpen,
  }) : super(key: key);
  final VoidCallback closeOpen;

  @override
  State<PlayerFullScreen> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<PlayerFullScreen> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(stops: [
        0.1,
        0.6
      ], colors: [
        Color(0xFF07202B),
        Color.fromARGB(255, 9, 26, 31),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        //backgroundColor: nowPlaying["playerColor"],
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              widget.closeOpen();
            },
            icon: const Icon(FluentIcons.chevron_down_20_regular),
          ),
          title: const Text(
            'X&Y',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.more_horizontal_20_regular))
          ],
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          'https://i.scdn.co/image/ab67616d0000b2734e0362c225863f6ae2432651'),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 20),
                        child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text(
                              'Fix You',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            subtitle: const Text(
                              'Coldplay',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                              icon: isLiked
                                  ? const Icon(
                                      FluentIcons.heart_20_filled,
                                      color: Colors.greenAccent,
                                    )
                                  : const Icon(FluentIcons.heart_20_regular),
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SliderTheme(
                          data: const SliderThemeData(
                              trackHeight: 3,
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 6)),
                          child: Slider(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white30,
                            divisions: 100,
                            value: 20,
                            onChanged: (value) {},
                            min: 0,
                            max: 100,
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  "0:40",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white54),
                                ),
                              ),
                              Text(
                                "-4:15",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white54),
                              )
                            ],
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      FluentIcons.arrow_shuffle_20_regular)),
                              IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(FluentIcons.previous_20_filled),
                                iconSize: 28,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    FluentIcons.play_circle_20_filled),
                                iconSize: 75,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(FluentIcons.next_20_filled),
                                iconSize: 28,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      FluentIcons.arrow_repeat_all_20_regular))
                            ],
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(FluentIcons
                                      .device_meeting_room_remote_20_regular)),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                    FluentIcons.share_ios_20_regular),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(FluentIcons.list_20_regular),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
