/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that cancelling a speech job fires the right events.
 */
import "dart:html";
import "../../testcommon.dart";

void main() {
    var speechSynthesis=window.speechSynthesis;
//    window.internals.enableMockSpeechSynthesizer(document);

    var u = new SpeechSynthesisUtterance("this is a test");
    u.onStart.listen((event) {
       asyncEnd();
       print("Speech started");
    });

    u.onError.listen((event) {
       asyncEnd();
       print("Speech error received because we cancelled and speech should no longer be pending.");
       Expect.isTrue(speechSynthesis.pending);
    });

    // Queue the first job which will start speaking immediately.
    speechSynthesis.speak(u);

    // Make a few more jobs, so that when we cancel, it will clear the entire queue.
    var u2 = new SpeechSynthesisUtterance("this is a second test");
    speechSynthesis.speak(u2);

    // Make a few more jobs, so that when we cancel, it will clear the entire queue.
    var u3 = new SpeechSynthesisUtterance("this is a third test");
    speechSynthesis.speak(u3);

    // While we have two jobs, speech synthesis should report that it's pending.
    Expect.isTrue(speechSynthesis.pending);

    asyncMultiStart(2);

    // Cancel speaking.
    runLater((){speechSynthesis.cancel();}, 10); 
}
