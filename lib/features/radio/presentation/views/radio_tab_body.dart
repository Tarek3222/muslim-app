import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:muslim/features/radio/data/model/radios_response.dart';

class RadioTabBody extends StatefulWidget {
  const RadioTabBody({super.key});

  @override
  State<RadioTabBody> createState() => _RadioTabBodyState();
}

class _RadioTabBodyState extends State<RadioTabBody> {
  final player = AudioPlayer();
  String currentState = 'pause';
  int currentIndex = 0;
  Future<RadiosResponse> getRadios(String currentLanguage) async {
    currentLanguage = (currentLanguage == 'en') ? 'eng' : 'ar';

    var response = await Dio()
        .get("https://mp3quran.net/api/v3/radios?language=$currentLanguage");
    if (response.statusCode == 200) {
      var result = response.data;
      return RadiosResponse.fromJson(result);
    } else {
      throw Exception('Failed to load radios');
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: mediaQuery.height / 6),
        Image.asset('assets/images/radio_header.png'),
        const SizedBox(height: 60),
        Text(
          'Quran Radio Stations',
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 20),
        FutureBuilder<RadiosResponse>(
          future: getRadios(Localizations.localeOf(context).languageCode),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var radios = snapshot.data!.radios!;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await player.stop();
                      currentState = 'pause';
                      if (currentIndex > 0) {
                        currentIndex--;
                      } else {
                        currentIndex = radios.length - 1;
                      }
                      currentState = 'play';
                      setState(() {});
                      await player.play(UrlSource(radios[currentIndex].url!));
                    },
                    icon: const ImageIcon(
                      AssetImage(
                        'assets/images/previous_icon.png',
                      ),
                    ),
                    color: theme.colorScheme.onSecondary,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (currentState == 'pause') {
                        await player.play(UrlSource(radios[currentIndex].url!));
                        currentState = 'play';
                        setState(() {});
                      } else {
                        await player.stop();
                        currentState = 'pause';
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      currentState == 'pause'
                          ? Icons.play_arrow_rounded
                          : Icons.pause_rounded,
                      size: 40,
                    ),
                    color: theme.colorScheme.onSecondary,
                  ),
                  IconButton(
                    onPressed: () async {
                      await player.stop();
                      currentState = 'pause';
                      if (currentIndex < radios.length - 1) {
                        currentIndex++;
                      } else {
                        currentIndex = 0;
                      }
                      currentState = 'play';
                      setState(() {});
                      await player.play(UrlSource(radios[currentIndex].url!));
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/images/next_icon.png'),
                    ),
                    color: theme.colorScheme.onSecondary,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Check your internet connection",
                  style: theme.textTheme.titleLarge,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.onSecondary,
              ),
            );
          },
        ),
      ],
    );
  }
}
