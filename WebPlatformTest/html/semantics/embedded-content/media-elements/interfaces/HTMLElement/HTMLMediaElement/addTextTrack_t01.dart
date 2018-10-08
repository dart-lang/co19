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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/addTextTrack.html
 * @assertion 
 * @description HTMLMediaElement.addTextTrack
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

var video = document.createElement('video') as VideoElement;

test((){
    assert_throws("", (){
        video.addTextTrack('foo');
    });
    assert_throws("", (){
        video.addTextTrack(null);
    });
}, document.title + ' bogus first arg');

test((){
    assert_throws("SyntaxError", (){
        video.addTextTrack('SUBTITLES');
    });
}, document.title + ' uppercase first arg');

test((){
    var t = video.addTextTrack('subtitles');
    assert_equals(t.kind, 'subtitles');
    assert_equals(t.label, '');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' subtitles first arg');

test((){
    var t = video.addTextTrack('captions');
    assert_equals(t.kind, 'captions');
    assert_equals(t.label, '');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' captions first arg');

test((){
    var t = video.addTextTrack('descriptions');
    assert_equals(t.kind, 'descriptions');
    assert_equals(t.label, '');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' descriptions first arg');

test((){
    var t = video.addTextTrack('chapters');
    assert_equals(t.kind, 'chapters');
    assert_equals(t.label, '');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' chapters first arg');

test((){
    var t = video.addTextTrack('metadata');
    assert_equals(t.kind, 'metadata');
    assert_equals(t.label, '');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' metadata first arg');

test((){
    var t = video.addTextTrack('subtitles', null, null);
    assert_equals(t.kind, 'subtitles', 'subtitles');
    assert_equals(t.label, 'null', 'null label');
    assert_equals(t.language, 'null', 'null language');
    assert_equals(t.mode, 'hidden', 'hidden mode');
    assert_true(t.cues is TextTrackCueList, "t.cues is ${t.cues.runtimeType}");
    assert_equals(t.cues.length, 0);
}, document.title + ' null second and third arg');

test((){
    var t = video.addTextTrack('subtitles', 'foo', 'bar');
    assert_equals(t.kind, 'subtitles');
    assert_equals(t.label, 'foo');
    assert_equals(t.language, 'bar');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' foo and bar second and third arg');

test((){
    var t = video.addTextTrack('subtitles', 'foo');
    assert_equals(t.kind, 'subtitles');
    assert_equals(t.label, 'foo');
    assert_equals(t.language, '');
    assert_equals(t.mode, 'hidden');
    assert_true(t.cues is TextTrackCueList);
    assert_equals(t.cues.length, 0);
}, document.title + ' foo second arg, third arg omitted');
  
   checkTestFailures();
}
