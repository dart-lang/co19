/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that the basic mechanisms of speaking text work, including sending the job and receving the callback. 
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var speechSynthesis=window.speechSynthesis;
    // Start a very short speaking job that will finish quickly.
    var u = new SpeechSynthesisUtterance(" ");

    u.onStart.listen((event) {
       asyncEnd();
       Expect.isTrue(event.elapsedTime > 0);
       Expect.isTrue(speechSynthesis.speaking);
    });
    u.onEnd.listen((event) {
       asyncEnd();
       Expect.isTrue(event.elapsedTime > 0);
       Expect.isFalse(speechSynthesis.speaking);
    });

    Expect.isFalse(speechSynthesis.speaking);
    asyncMultiStart(2);
    speechSynthesis.speak(u);
}
