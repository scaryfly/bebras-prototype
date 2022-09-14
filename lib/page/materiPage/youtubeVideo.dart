import 'package:bebras_task/mainPageScreen.dart';
import 'package:bebras_task/page/landingPage/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtubeVideoScreen extends StatelessWidget {
  final String url, title;
  const youtubeVideoScreen({Key? key, required this.url, required this.title})
      : super(key: key);

  get appWhite => null;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        builder: (context, player) => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: appWhite),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MainPageScreen();
                  })),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: appWhite,
                  ),
                ),
              ),
              body: Background(
                child: Center(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0), child: player),
                ),
              ),
            ));
  }
}
