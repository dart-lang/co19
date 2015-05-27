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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/src.html
 * @assertion 
 * @description HTMLMediaElement.src
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.src, '');
    assert_equals(track.getAttribute('src'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('src', '');
    assert_equals(track.getAttribute('src'), '', "getAttribute");
    assert_equals(track.src, '', "track.src");
}, document.title + ' empty string in content attribute');

test((){
    var track = document.createElement('track');
    track.src = '';
    assert_equals(track.getAttribute('src'), '', "getAttribute");
    assert_equals(track.src, '', "track.src");
}, document.title + ' empty string in IDL attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('src', 'http://foo bar');
    assert_equals(track.getAttribute('src'), 'http://foo bar', "getAttribute");
    assert_equals(track.src, 'http://foo bar', "track.src");
}, document.title + ' unresolvable value in content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('src', 'test');
    var link = document.createElement('a');
    link.setAttribute('href', 'test');
    assert_equals(track.getAttribute('src'), 'test', "getAttribute");
    assert_equals(track.src, link.href, "track.src");
}, document.title + ' resolvable value in content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('src', '\u0000');
    var link = document.createElement('a');
    link.setAttribute('href', '%00');
    assert_equals(track.getAttribute('src'), '\u0000', "getAttribute");
    assert_equals(track.src, link.href, "track.src");
}, document.title + ' \\u0000 in content attribute');

test((){
    var track = document.createElement('track');
    track.src = 'http://foo bar';
    assert_equals(track.getAttribute('src'), 'http://foo bar', "getAttribute");
    assert_equals(track.src, 'http://foo bar', "track.src");
}, document.title + ' assigning unresolvable value to IDL attribute');

test((){
    var track = document.createElement('track');
    track.src = 'test';
    var link = document.createElement('a');
    link.setAttribute('href', 'test');
    assert_equals(track.getAttribute('src'), 'test', "getAttribute");
    assert_equals(track.src, link.href, "track.src");
}, document.title + ' assigning resolvable value to IDL attribute');

test((){
    var track = document.createElement('track');
    track.src = '\u0000';
    var link = document.createElement('a');
    link.setAttribute('href', '%00');
    assert_equals(track.getAttribute('src'), '\u0000', "getAttribute");
    assert_equals(track.src, link.href, "track.src");
}, document.title + ' assigning \\u0000 to IDL attribute');

   checkTestFailures();
}
