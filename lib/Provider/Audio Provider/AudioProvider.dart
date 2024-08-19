import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerProvider with ChangeNotifier, WidgetsBindingObserver {
  late final AudioPlayer _audioPlayer;
  late final StreamController<bool> _isPlayingController;
  late final StreamController<Duration> _positionController;
  late final StreamController<Duration> _durationController;
  bool _isfinished = false;
  LoopMode _loopMode = LoopMode.off;
  bool _islooping = false;

  bool get isfinished => _isfinished;

  bool get islooping => _islooping;

  AudioPlayerProvider() {
    _audioPlayer = AudioPlayer();
    _isPlayingController = StreamController<bool>.broadcast();
    _positionController = StreamController<Duration>.broadcast();
    _durationController = StreamController<Duration>.broadcast();
    _init();
    WidgetsBinding.instance.addObserver(this); // Add observer
  }

  void _init() {
    _audioPlayer.playbackEventStream.listen((event) {
      final isPlaying = _audioPlayer.playing;
      _isPlayingController.add(isPlaying);
      if (_audioPlayer.duration != null) {
        _durationController.add(_audioPlayer.duration!);
      }
    });

    _audioPlayer.positionStream.listen((position) {
      _positionController.add(position);
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        print('completed');
        if (_loopMode == LoopMode.off) {
          resetPlayer();
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      // Pause the audio when the app goes into the background
      pause();
    }
    super.didChangeAppLifecycleState(state);
  }

  void resetPlayer() async {
    _positionController.add(Duration.zero); // Clear any existing position
    _isPlayingController.add(false);
    await _audioPlayer.pause();
    _isfinished = true;
    notifyListeners();
  }

  Future<void> setLoopMode(LoopMode loopMode) async {
    _loopMode = loopMode;
    await _audioPlayer.setLoopMode(loopMode);
  }

  Future<void> toggleLoop() async {
    if (_loopMode == LoopMode.off) {
      _islooping = true;
      notifyListeners();
      await setLoopMode(LoopMode.one);
    } else {
      _islooping = false;
      notifyListeners();
      await setLoopMode(LoopMode.off);
    }
  }

  LoopMode get loopMode => _loopMode;

  Stream<bool> get isPlayingStream => _isPlayingController.stream;

  Stream<Duration> get positionStream => _positionController.stream;

  Stream<Duration> get durationStream => _durationController.stream;

  Future<void> play(String path) async {
    await _audioPlayer.setFilePath(path);
    await _audioPlayer.play();
    _isfinished = false;
    notifyListeners();
  }

  Future<void> pause() async {
    _isPlayingController.add(false);
    await _audioPlayer.pause();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  Future<void> playFromPause(String path) async {
    await _audioPlayer.play();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    _audioPlayer.dispose();
    _isPlayingController.close();
    _positionController.close();
    _durationController.close();
    super.dispose();
  }
}
