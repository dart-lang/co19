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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/TextTrack/mode.html
 * @assertion 
 * @description TextTrack.mode
 */
import 'dart:html';
import "../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    TrackElement track = document.createElement('track') as TrackElement;
    assert_equals(track.track.mode, 'disabled', 'initial');
    track.track.mode = '1';
    assert_equals(track.track.mode, '1', '1');
    track.track.mode = '';
    assert_equals(track.track.mode, 'disabled', 'empty string');
    track.track.mode = 'null';
    assert_equals(track.track.mode, 'disabled', 'null');
    track.track.mode = 'showing';
    assert_equals(track.track.mode, 'showing', 'showing (correct value)');
    track.track.mode = 'DISABLED';
    assert_equals(track.track.mode, 'showing', '"DISABLED"');
    track.track.mode = 'd\u0130sabled'; // dotted uppercase i
    assert_equals(track.track.mode, 'showing', '"d\u0130sabled" (dotted uppercase i)');
    track.track.mode = 'd\u0131sabled'; // dotless lowercase i
    assert_equals(track.track.mode, 'showing', '"d\u0131sabled" (dotless lowercase i)');
    track.track.mode = 'disabled ';
    assert_equals(track.track.mode, 'showing', '"disabled "');
    track.track.mode = ' disabled';
    assert_equals(track.track.mode, 'showing', '" disabled"');
    track.track.mode = 'HIDDEN';
    assert_equals(track.track.mode, 'showing', '"HIDDEN"');
    track.track.mode = 'h\u0130dden'; // dotted uppercase i
    assert_equals(track.track.mode, 'showing', '"h\u0130dden" (dotted uppercase i)');
    track.track.mode = 'h\u0131dden'; // dotless lowercase i
    assert_equals(track.track.mode, 'showing', '"h\u0131dden" (dotless lowercase i)');
}, document.title+', wrong value');

test(() {
    var track = document.createElement('track') as TrackElement;
    assert_equals(track.track.mode, 'disabled', 'initial');
    track.track.mode = 'disabled'; // no-op
    assert_equals(track.track.mode, 'disabled', 'disabled (1)');
    track.track.mode = 'hidden';
    assert_equals(track.track.mode, 'hidden', 'hidden (1)');
    track.track.mode = 'hidden'; // no-op
    assert_equals(track.track.mode, 'hidden', 'hidden (2)');
    track.track.mode = 'showing';
    assert_equals(track.track.mode, 'showing', 'showing (1)');
    track.track.mode = 'showing'; // no-op
    assert_equals(track.track.mode, 'showing', 'showing (2)');
}, document.title+', correct value');

   checkTestFailures();
}
