/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests the JSEP PeerConnection related constructors.
 */
import "dart:html";

void main() {
    new RtcPeerConnection({"iceServers":[{"url":'stun://foobar.com:12345'}]}, null);
    new RtcSessionDescription({"type":'offer',"sdp":'foobar'});
    new RtcIceCandidate({"candidate":'foo'});
}