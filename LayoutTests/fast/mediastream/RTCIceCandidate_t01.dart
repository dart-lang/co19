/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests RtcIceCandidate.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";

void main() {
    var initializer = {"candidate":"foo", "sdpMid":"bar", "sdpMLineIndex":6};
    var candidate = new RtcIceCandidate(initializer);
    shouldBe(candidate.candidate, 'foo');
    shouldBe(candidate.sdpMid, 'bar');
    shouldBe(candidate.sdpMLineIndex, 6);
    
    new RtcIceCandidate({"candidate":"x"});
    
    candidate = new RtcIceCandidate(initializer);
    candidate.candidate = "bar";
    candidate.sdpMid = "foo";
    candidate.sdpMLineIndex = 0;
    shouldBe(candidate.candidate, 'bar');
    shouldBe(candidate.sdpMid, 'foo');
    shouldBe(candidate.sdpMLineIndex, 0);
    checkTestFailures();
}
