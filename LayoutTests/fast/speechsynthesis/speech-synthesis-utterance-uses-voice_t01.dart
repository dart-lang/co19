/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that we can get synthesizer voices on the Mac 
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var speechSynthesis=window.speechSynthesis;
    var list = speechSynthesis.getVoices();
    Expect.isTrue(list.length>0);
    var voice = list[0];

    // Start a very short speaking job that will finish quickly.
    var u = new SpeechSynthesisUtterance("this is a test string.");
    u.voice = voice;

    print("Verify that setting and retrieving the voice works.");
    Expect.isTrue(u.voice.name == voice.name);

    u.onEnd.listen((event) {
       asyncEnd();
       print("Speech job finished successfully.");
    });

    asyncStart();
    speechSynthesis.speak(u);    
}
