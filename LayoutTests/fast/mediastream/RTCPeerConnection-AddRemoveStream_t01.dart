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
import "../../testcommon.dart";

RtcPeerConnection pc;
MediaStream stream;
MediaStream stream2;

void error(NavigatorUserMediaError e) {
    Expect.fail('Stream generation failed:"${e.constraintName}"');
    asyncEnd();
}

void getUserMedia(void callback(MediaStream s), {audio: false, video: false}) {
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

    //pc.onNegotiationNeeded = onErroneousNegotiationNeeded;
    pc.addStream(stream);
    Expect.equals(1, pc.getLocalStreams().length);
    pc.removeStream(stream2);
    Expect.equals(1, pc.getLocalStreams().length);

    //pc.onNegotiationNeeded = onRemoveStream;
    pc.removeStream(stream);
}

void gotStream2(MediaStream s) {
    print('Got another stream.');
    stream2 = s;

    Expect.notEquals(stream.id, stream2.id);

    pc = new RtcPeerConnection(null, null);
    //pc.onNegotiationNeeded = onAddStream;
    pc.addStream(stream);
}

void gotStream1(MediaStream s) {
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
