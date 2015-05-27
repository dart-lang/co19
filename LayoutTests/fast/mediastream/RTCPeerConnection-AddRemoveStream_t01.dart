/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests RTCPeerConnection [add|remove]Stream.
 */
import "dart:html";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

var pc;
var stream;
var stream2;

void error(NavigatorUserMediaError e) {
    Expect.fail('Stream generation failed:"${e.constraintName}"');
    asyncEnd();
}

void getUserMedia(callback, {audio: false, video: false}) {
    try {
        window.navigator.getUserMedia(audio:audio, video:video).then(callback, onError:error);
    } catch (e) {
        Expect.fail('getUserMedia threw exception :' + e);
        asyncEnd();
    }
}

void onErroneousNegotiationNeeded(e) {
    Expect.fail('onErroneousNegotiationNeeded was called:$e');
    asyncEnd();
}

void onRemoveStream(event) {
    Expect.equals(0, pc.getLocalStreams().length);
    asyncEnd();
}

void onAddStream(event) {
    print('onAddStream was called.');

    Expect.equals(stream, pc.getStreamById(stream.id));
    Expect.equals(null, pc.getStreamById(stream2.id));

    pc.onnegotiationneeded = onErroneousNegotiationNeeded;
    pc.addStream(stream);
    Expect.equals(1, pc.getLocalStreams().length);
    pc.removeStream(stream2);
    Expect.equals(1, pc.getLocalStreams().length);

    pc.onnegotiationneeded = onRemoveStream;
    pc.removeStream(stream);
}

void gotStream2(s) {
    print('Got another stream.');
    stream2 = s;

    Expect.notEquals(stream.id, stream2.id);

    pc = new webkitRTCPeerConnection(null, null);
    pc.onnegotiationneeded = onAddStream;
    pc.addStream(stream);
}

void gotStream1(s) {
    print('Got a stream.');
    stream = s;

    getUserMedia(gotStream2, audio:true, video:true);
}

void main() {
    if (!MediaStream.supported) {
       print("MediaStream: not supported");
       return;
    }
    asyncStart();
    getUserMedia(gotStream1, audio:true, video:true);
}
