import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceService extends ChangeNotifier {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = "";

  bool get isListening => _isListening;
  String get text => _text;

  Future<void> init() async {
    await _speech.initialize();
  }

  Future<void> startListening(Function(String) onResult) async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        _isListening = true;
        _text = "";
        notifyListeners();
        
        await _speech.listen(
          onResult: (result) {
            _text = result.recognizedWords;
            onResult(_text);
            notifyListeners();
          },
          listenFor: const Duration(seconds: 30),
          pauseFor: const Duration(seconds: 5),
          cancelOnError: true,
          listenMode: stt.ListenMode.confirmation,
        );
      }
    }
  }

  Future<void> stopListening() async {
    if (_isListening) {
      await _speech.stop();
      _isListening = false;
      notifyListeners();
    }
  }
}
