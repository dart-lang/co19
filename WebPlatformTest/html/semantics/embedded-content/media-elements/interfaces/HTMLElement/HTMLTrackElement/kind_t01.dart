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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/kind.html
 * @assertion 
 * @description HTMLMediaElement.kind
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track') as TrackElement;
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'invalid');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'invalid');
}, document.title + ' invalid value in content attribute');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'CAPTIONS');
    assert_equals(track.kind, 'captions');
    assert_equals(track.getAttribute('kind'), 'CAPTIONS');
}, document.title + ' content attribute uppercase');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'CAPT\u0130ONS');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'CAPT\u0130ONS');
}, document.title + ' content attribute with uppercase turkish I (with dot)');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'capt\u0131ons');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'capt\u0131ons');
}, document.title + ' content attribute with lowercase turkish i (dotless)');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'subtitles');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'subtitles');
}, document.title + ' content attribute "subtitles"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'captions');
    assert_equals(track.kind, 'captions');
    assert_equals(track.getAttribute('kind'), 'captions');
}, document.title + ' content attribute "captions"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'descriptions');
    assert_equals(track.kind, 'descriptions');
    assert_equals(track.getAttribute('kind'), 'descriptions');
}, document.title + ' content attribute "descriptions"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'chapters');
    assert_equals(track.kind, 'chapters');
    assert_equals(track.getAttribute('kind'), 'chapters');
}, document.title + ' content attribute "chapters"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'metadata');
    assert_equals(track.kind, 'metadata');
    assert_equals(track.getAttribute('kind'), 'metadata');
}, document.title + ' content attribute "metadata"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.setAttribute('kind', 'captions\u0000');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'captions\u0000');
}, document.title + ' content attribute "captions\\u0000"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'subtitles';
    assert_equals(track.getAttribute('kind'), 'subtitles');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute to "subtitles"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'captions';
    assert_equals(track.getAttribute('kind'), 'captions');
    assert_equals(track.kind, 'captions');
}, document.title + ' setting IDL attribute to "captions"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'descriptions';
    assert_equals(track.getAttribute('kind'), 'descriptions');
    assert_equals(track.kind, 'descriptions');
}, document.title + ' setting IDL attribute to "descriptions"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'chapters';
    assert_equals(track.getAttribute('kind'), 'chapters');
    assert_equals(track.kind, 'chapters');
}, document.title + ' setting IDL attribute to "chapters"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'metadata';
    assert_equals(track.getAttribute('kind'), 'metadata');
    assert_equals(track.kind, 'metadata');
}, document.title + ' setting IDL attribute to "metadata"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'CAPTIONS';
    assert_equals(track.getAttribute('kind'), 'CAPTIONS');
    assert_equals(track.kind, 'captions');
}, document.title + ' setting IDL attribute to "CAPTIONS"');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'CAPT\u0130ONS';
    assert_equals(track.getAttribute('kind'), 'CAPT\u0130ONS');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with uppercase turkish I (with dot)');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'capt\u0131ons';
    assert_equals(track.getAttribute('kind'), 'capt\u0131ons');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with lowercase turkish I (dotless)');

test((){
    var track = document.createElement('track') as TrackElement;
    track.kind = 'captions\u0000';
    assert_equals(track.getAttribute('kind'), 'captions\u0000');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with \\u0000');

   checkTestFailures();
}
