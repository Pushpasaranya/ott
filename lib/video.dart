import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:ott/bot.dart';


class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => bot()));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: theme.textTheme.bodyText1!.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: FlickVideoPlayer(flickManager: flickManager),
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Text(
                'Baahubali: Crown of Blood',
                style: TextStyle(
                  color: theme.textTheme.bodyText1!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Episodes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyText1!.color,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Card(
                color: theme.cardColor,
                child: SingleChildScrollView(
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 80,
                      child: Image.asset("assets/img_2.png"),
                    ),
                    title: Text(
                      "Return to Mazhilmathi",
                      style: TextStyle(
                        color: theme.textTheme.bodyText1!.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "S1 E1 • 17 May 2024 • 28m",
                      style: TextStyle(color: theme.textTheme.bodyText1!.color),
                    ),
                    trailing: Icon(
                      Icons.arrow_downward_outlined,
                      color: theme.textTheme.bodyText1!.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
