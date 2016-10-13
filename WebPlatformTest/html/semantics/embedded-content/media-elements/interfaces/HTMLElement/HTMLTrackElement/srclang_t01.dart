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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/srclang.html
 * @assertion 
 * @description HTMLMediaElement.srclang
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track') as TrackElement;
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('srclang', '');
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.srclang = '';
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), '');
}, document.title + ' empty string IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('srclang', 'foo');
    assert_equals(track.srclang, 'foo');
    assert_equals(track.getAttribute('srclang'), 'foo');
}, document.title + ' lowercase content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('srclang', 'FOO');
    assert_equals(track.srclang, 'FOO');
    assert_equals(track.getAttribute('srclang'), 'FOO');
}, document.title + ' uppercase content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('srclang', '\u0000');
    assert_equals(track.srclang, '\u0000');
    assert_equals(track.getAttribute('srclang'), '\u0000');
}, document.title + ' \\u0000 content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.srclang = 'foo';
    assert_equals(track.srclang, 'foo');
    assert_equals(track.getAttribute('srclang'), 'foo');
}, document.title + ' lowercase IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.srclang = 'FOO';
    assert_equals(track.srclang, 'FOO');
    assert_equals(track.getAttribute('srclang'), 'FOO');
}, document.title + ' uppercase IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('srclang', ' foo \n');
    assert_equals(track.srclang, ' foo \n');
    assert_equals(track.getAttribute('srclang'), ' foo \n');
}, document.title + ' whitespace in content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.srclang = ' foo \n';
    assert_equals(track.srclang, ' foo \n');
    assert_equals(track.getAttribute('srclang'), ' foo \n');
}, document.title + ' whitespace in IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.srclang = '\u0000';
    assert_equals(track.srclang, '\u0000');
    assert_equals(track.getAttribute('srclang'), '\u0000');
}, document.title + ' \\u0000 in IDL attribute');

   checkTestFailures();
}
