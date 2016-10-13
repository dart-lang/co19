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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/label.html
 * @assertion 
 * @description HTMLMediaElement.label
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track') as TrackElement;
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('label', '');
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.label = '';
    assert_equals(track.label, '');
    assert_equals(track.getAttribute('label'), '');
}, document.title + ' empty string IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('label', 'foo');
    assert_equals(track.label, 'foo');
    assert_equals(track.getAttribute('label'), 'foo');
}, document.title + ' lowercase content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('label', 'FOO');
    assert_equals(track.label, 'FOO');
    assert_equals(track.getAttribute('label'), 'FOO');
}, document.title + ' uppercase content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('label', '\u0000');
    assert_equals(track.label, '\u0000');
    assert_equals(track.getAttribute('label'), '\u0000');
}, document.title + '\\u0000 in content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.label = 'foo';
    assert_equals(track.label, 'foo');
    assert_equals(track.getAttribute('label'), 'foo');
}, document.title + ' lowercase IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.label = 'FOO';
    assert_equals(track.label, 'FOO');
    assert_equals(track.getAttribute('label'), 'FOO');
}, document.title + ' uppercase IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('label', ' foo \n');
    assert_equals(track.label, ' foo \n');
    assert_equals(track.getAttribute('label'), ' foo \n');
}, document.title + ' whitespace in content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.label = ' foo \n';
    assert_equals(track.label, ' foo \n');
    assert_equals(track.getAttribute('label'), ' foo \n');
}, document.title + ' whitespace in IDL attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.label = '\u0000';
    assert_equals(track.label, '\u0000');
    assert_equals(track.getAttribute('label'), '\u0000');
}, document.title + ' \\u0000 in IDL attribute');

   checkTestFailures();
}
