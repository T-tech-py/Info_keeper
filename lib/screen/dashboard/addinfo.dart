// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:file/local.dart';
import 'package:flutter/services.dart';
import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_keeper/const/colors.dart';
import 'package:info_keeper/router/navigators.dart';
import 'package:info_keeper/screen/logic/cameraLogick.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';
import 'package:info_keeper/widget/formField.dart';
import 'dart:async';
import 'dart:io' as io;
import 'dart:core';
import 'package:rxdart/rxdart.dart';
import 'package:path_provider/path_provider.dart';

class AddNewFile extends StatefulWidget {
  final LocalFileSystem localFileSystem;
  AddNewFile({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _AddNewFileState createState() => _AddNewFileState();
}

class _AddNewFileState extends State<AddNewFile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController discriptionText = TextEditingController();
  AnotherAudioRecorder? _recorder;
  Recording? _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;
  AudioPlayer audioPlayer = AudioPlayer();
  //late Stream<DurationState> _durationState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
    // _durationState = Rx.combineLatest2<Duration>(
    //     audioPlayer.onAudioPositionChanged.,
    //     audioPlayer.onPlayerStateChanged,
    //     (position, playback) => DurationState(
    //           progress: position,
    //         ));

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  int key = 1;
  dynamic time = 0.0;
  Duration progress = Duration.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        primary: true,
        elevation: 0.5,
        titleSpacing: 7,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SvgPicture.asset("assets/image/svg/back.svg",
                  width: 30.w, height: 30.w),
            )),
        title: Text(
          "Add File",
          style: GoogleFonts.josefinSans(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          children: [
            SizedBox(height: 50.h),
            CustomTextField(label: "Title", hintText: ""),
            SizedBox(height: 24.h),
            CustomFormField(
              label: "Description",
              hintText: '',
              controller: discriptionText,
            ),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.attach_file)),
                IconButton(
                    onPressed: () {
                      navigate(context, CameraApp());
                    },
                    icon: const Icon(Icons.camera_alt_outlined)),
                GestureDetector(
                  onLongPressDown: (details) async {
                    bool hasPermission =
                        await AnotherAudioRecorder.hasPermissions;
                    switch (_currentStatus) {
                      case RecordingStatus.Initialized:
                        {
                          _start();
                          break;
                        }

                      case RecordingStatus.Stopped:
                        {
                          _init();
                          break;
                        }
                      default:
                        break;
                    }
                  },
                  onLongPressEnd: (LongPressEndDetails onLongPressEnd) =>
                      _stop(),
                  child: _currentStatus == RecordingStatus.Recording
                      ? const Icon(Icons.stop, color: Colors.red)
                      : const Icon(Icons.mic_none),
                )
              ],
            ),
            Text("Status : $_currentStatus"),
            Row(
              children: [
                if (key == 2)
                  Expanded(
                    child: StreamBuilder<Object>(
                        stream: audioPlayer.onAudioPositionChanged,
                        builder: (context, snapshot) {
                          // final reg = snapshot.data?.progress ?? Duration.zero;
                          return ProgressBar(
                            timeLabelType: TimeLabelType.totalTime,
                            progress: progress,
                            total: Duration(microseconds: time),
                            onSeek: (duration) async {
                              await audioPlayer.seek(duration);
                              print(duration);
                            },
                          );
                        }),
                  ),
                FlatButton(
                  onPressed:
                      _currentStatus != RecordingStatus.Unset ? _stop : null,
                  child: Text("Stop", style: TextStyle(color: Colors.white)),
                  color: Colors.blueAccent.withOpacity(0.5),
                ),
                FlatButton(
                  onPressed: onPlayAudio,
                  child: Text("Play", style: TextStyle(color: Colors.white)),
                  color: Colors.blueAccent.withOpacity(0.5),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            LoginButton(text: "Save", onPressed: () {}, isLogin: true),
            SizedBox(height: 44.h),
          ],
        ),
      ),
    );
  }

  _init() async {
    try {
      if (await AnotherAudioRecorder.hasPermissions) {
        String customPath = '/another_audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        _recorder =
            AnotherAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await _recorder?.initialized;
        // after initialization
        var current = await _recorder?.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current!.status!;
          print(_currentStatus);
        });
      } else {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder?.start();
      var recording = await _recorder?.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder?.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current!.status!;
        });
      });
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("You have started recording")));
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var result = await _recorder?.stop();

    setState(() {
      key = 2;
      time = result?.duration!.inMicroseconds.toInt();
      print(result?.duration!.inMicroseconds.toDouble());
    });
    _controller.forward();
    print("Stop recording: ${result?.path}");
    print("Stop recording: ${result?.duration}");
    var file = widget.localFileSystem.file(result?.path);
    print("File length: ${await file.length()}");
    setState(() {
      _current = result;
      _currentStatus = _current!.status!;
    });
    onPlayAudio();
  }

  void onPlayAudio() async {
    //print(_current!.path!);

    await audioPlayer.play(
      _current!.path!,
      isLocal: true,
    );
    setState(() {
      audioPlayer.onAudioPositionChanged.listen((event) {
        progress = event;
        print(progress);
      });
    });
  }
}

// class DurationState {
//   final Duration progress;

//   DurationState(
//     this.progress, {required progress},
//   );
//}
