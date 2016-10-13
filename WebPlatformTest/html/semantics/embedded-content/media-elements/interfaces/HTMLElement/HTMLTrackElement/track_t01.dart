/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/track.html
 * @assertion 
 * @description HTMLMediaElement.track
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {
    var track = document.createElement('track') as TrackElement;
    assert_equals(track.track, track.track, 'same object should be returned');
    assert_true(track.track is TextTrack, 'returned object should be a TextTrack');
}
