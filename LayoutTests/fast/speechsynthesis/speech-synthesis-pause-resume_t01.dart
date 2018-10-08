/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that pausing/resuming speech jobs works as expected.
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var u = new SpeechSynthesisUtterance("this is a test");
    var speechSynthesis=window.speechSynthesis;

    // Verify that callbacks and state are correct for paused and speaking states.
    u.onPause.listen((event) {
       asyncEnd();
       print("On pause event received.");
       Expect.isTrue(speechSynthesis.paused);
       Expect.isTrue(speechSynthesis.speaking);
    });

    u.onResume.listen((event) {
       asyncEnd();
       print("On resume event received.");
       Expect.isFalse(speechSynthesis.paused);
       Expect.isTrue(speechSynthesis.speaking);
    });
 
    u.onEnd.listen((event) {
       asyncEnd();
       print("On end event received.");
       Expect.isFalse(speechSynthesis.paused);
       Expect.isFalse(speechSynthesis.speaking);
    });

    speechSynthesis.speak(u);

    asyncMultiStart(3);
    // Quickly pause and resume the speech job.
    runLater((){speechSynthesis.pause();}, 10);
    runLater((){speechSynthesis.resume();}, 20);
}
