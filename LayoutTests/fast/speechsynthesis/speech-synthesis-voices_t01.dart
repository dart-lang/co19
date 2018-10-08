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
    SpeechSynthesis speech = window.speechSynthesis;
    List<SpeechSynthesisVoice> list = speech.getVoices();

    bool foundDefaultVoice = false;
    bool foundEnglishVoice = false;
    Expect.isTrue(list.length>0, "length");
 
    for (int k = 0; k < list.length; k++ ) {
        SpeechSynthesisVoice voice = list[k];
        if (voice.lang == "en-US") {
            foundEnglishVoice = true;
        }
        if (voice. defaultValue) {
            foundDefaultVoice = true;
        }
    }

    Expect.isTrue(foundEnglishVoice, "foundEnglishVoice");
    Expect.isTrue(foundDefaultVoice, "foundDefaultVoice");
}
