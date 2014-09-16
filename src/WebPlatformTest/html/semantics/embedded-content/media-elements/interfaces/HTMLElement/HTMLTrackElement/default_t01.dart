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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLTrackElement/default.html
 * @assertion 
 * @description HTMLTrackElement.default
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.getAttribute('default'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('default', '');
    assert_equals(track.getAttribute('default'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('default', 'foo');
    assert_equals(track.getAttribute('default'), 'foo');
}, document.title + ' foo in content attribute');

   checkTestFailures();
}
