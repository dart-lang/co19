/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests webkitGetUserMedia.
 */
import "dart:html";
import "../../testcommon.dart";

Navigator navigator=window.navigator;

void error(dynamic arg) {
    Expect.fail('Error callback called.');
}

void gotStreamInError(s) {
    Expect.fail('gotStreamInError');
}

void gotStream5(stream) {
    print("callback: gotStream5");
    Expect.equals(1, stream.getAudioTracks().length);
    Expect.equals(1, stream.getVideoTracks().length);
    asyncEnd();
}

void error1(errorArg) {
    print("callback: error1");
    Expect.equals('ConstraintNotSatisfiedError', errorArg.name);
    Expect.equals('valid_but_unsupported_1', errorArg.constraintName);
    navigator.getUserMedia(
        audio:{"mandatory":{'valid_and_supported_1':1}, "optional":[{'valid_but_unsupported_1':0}]}, video:true)
        .then(gotStream5, onError:error);
}

void gotStream4(stream) {
    print("callback: gotStream4");
    Expect.equals(1, stream.getAudioTracks().length);
    Expect.equals(1, stream.getVideoTracks().length);
    navigator.getUserMedia(audio:{"mandatory":{'valid_but_unsupported_1':0}, "optional":[]}, video:true)
    .then(gotStreamInError, onError:error1);
}

void gotStream3(stream) {
    print("callback: gotStream3");
    Expect.equals(1, stream.getAudioTracks().length);
    Expect.equals(1, stream.getVideoTracks().length);
    navigator.getUserMedia(audio:{"mandatory":{}, "optional":[]}, video:true)
    .then(gotStream4, onError:error);
}

void gotStream2(stream) {
    print("callback: gotStream2");
    Expect.equals(0, stream.getAudioTracks().length);
    Expect.equals(1, stream.getVideoTracks().length);
    navigator.getUserMedia(audio:true, video:true)
    .then(gotStream3, onError:error);
}

void gotStream1(stream) {
    print("callback: gotStream1");
    Expect.equals(1, stream.getAudioTracks().length);
    Expect.equals(0, stream.getVideoTracks().length);
    navigator.getUserMedia(video:true)
    .then(gotStream2, onError:error);
}

void main() {
    if (!MediaStream.supported) {
       print("MediaStream: not supported");
       return;
    }
    Expect.throws(() {
        navigator.getUserMedia(audio:false, video:false).then(error, onError:error);
    });
    asyncStart();
    navigator.getUserMedia(audio:true).then(gotStream1, onError:error);
}

