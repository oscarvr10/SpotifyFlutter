import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/presentation/widgets/shared/player_full_screen.dart';

class PlayerControl extends StatefulWidget {
  const PlayerControl({super.key});

  @override
  State<PlayerControl> createState() => _PlayerControlState();
}

class _PlayerControlState extends State<PlayerControl> {
  bool showFullscreen = false;
  bool offstage = false;

  @override
  void initState() {
    super.initState();
  }

  void nowPlayingMethod() {
    setState(() {
      showFullscreen = !showFullscreen;
      offstage = !offstage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        bottom: !showFullscreen ? 100 : 0,
        left: !showFullscreen ? 10 : 0,
        right: !showFullscreen ? 10 : 0,
        child: GestureDetector(
          onTap: () => nowPlayingMethod(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastOutSlowIn,
            width: !showFullscreen ? size.width * 0.9 : size.width,
            height: !showFullscreen ? size.height * 0.07 : size.height,
            decoration: BoxDecoration(
                color: const Color(0xFF0e1a26),
                borderRadius: showFullscreen
                    ? BorderRadius.circular(0)
                    : BorderRadius.circular(10)),
            child: showFullscreen
                ? Offstage(
                    offstage: !offstage,
                    child: PlayerFullScreen(
                      closeOpen: nowPlayingMethod,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 5, top: 8, bottom: 5),
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  'https://i.scdn.co/image/ab67616d0000b2734e0362c225863f6ae2432651',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fix You',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Coldplay',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FluentIcons
                                  .device_meeting_room_remote_20_regular)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(FluentIcons.play_20_filled))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: LinearProgressIndicator(
                          value: 0.2,
                          minHeight: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
