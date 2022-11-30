import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' as io;

import 'package:path_provider/path_provider.dart';

AnotherAudioRecorder? _recorder;
Recording? _current;
RecordingStatus _currentStatus = RecordingStatus.Unset;
