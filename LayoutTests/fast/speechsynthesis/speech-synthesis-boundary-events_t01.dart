/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that a speech job will generate the correct boundary events.
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var u = new SpeechSynthesisUtterance("this is a test");
    u.onStart.listen((event) {
       asyncEnd();
       print("Speech started");
    });

    u.onBoundary.listen((event) {
       asyncEnd();
       print("Boundary event: ${event.name}, Character index: ${event.charIndex}");
    });

    u.onEnd.listen((event) {
       asyncEnd();
    });

    asyncMultiStart(3);
    // Queue the first job which will start speaking immediately.
    window.speechSynthesis.speak(u);
}