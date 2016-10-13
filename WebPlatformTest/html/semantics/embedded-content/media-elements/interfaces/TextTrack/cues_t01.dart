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
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/TextTrack/cues.html
 * @assertion 
 * @description TextTrack.cues
 */
import 'dart:html';
import "../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    assert_equals(t1.cues, t1.cues, 't1.cues should return same object');
    assert_not_equals(t1.cues, null, 't1.cues should not be null');
    assert_true(t1.cues is TextTrackCueList, 't1.cues is TextTrackCueList');
    assert_equals(t1.cues.length, 0, 't1.cues.length');
}, document.title+', empty list');

VttCue addCue(texttrack, start, end, text, id) {
  var c = new VttCue(start, end, text);
  c.id = id;
  texttrack.addCue(c);
  return c;
}

test((){
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    var t1_cues = t1.cues;
    var c = addCue(t1, 0, 1, 'text', 'id');
    assert_equals(t1.cues, t1_cues, "t1.cues should return same object");
    assert_equals(t1.cues.length, 1, "t1.cues.length");
    var c2 = addCue(t1, 1, 2, 'text2', 'id2');
    assert_equals(t1.cues, t1_cues, "t1.cues should return the same object after adding a second cue");
    assert_equals(t1.cues.length, 2, "t1.cues.length after adding a second cue");
    assert_equals(t1.cues[0].id, "id");
    assert_equals(t1.cues[1].id, "id2");
}, document.title+', after addCue()');

test((){
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    var t1_cues = t1.cues;
    var c = addCue(t1, 0, 1, 'text', 'id');
    var c2 = addCue(t1, 1, 2, 'text2', 'id2');
    t1.mode = 'showing';
    assert_equals(t1.cues, t1_cues, "t1.cues should return the same object after setting mode to 'showing'");
    t1.mode = 'hidden';
    assert_equals(t1.cues, t1_cues, "t1.cues should return the same object after setting mode to 'hidden'");
    t1.mode = 'disabled';
    assert_equals(t1.cues, null, "t1.cues should be null when mode is 'disabled'");
    assert_equals(t1_cues.length, 2, "t1_cues should still be intact after setting mode to 'disabled'");
    assert_equals(t1_cues[0].id, "id", "t1_cues first cue should still be intact after setting mode to 'disabled'");
    assert_equals(t1_cues[1].id, "id2", "t1_cues second cue should still be intact after setting mode to 'disabled'");
    t1.mode = 'hidden';
    assert_equals(t1.cues, t1_cues, "t1.cues should return the same object after setting mode to 'disabled' and then 'hidden'");
    t1.mode = 'disabled';
    assert_equals(t1.cues, null, "t1.cues should be null when mode is set to 'disabled' again");
    assert_equals(t1_cues.length, 2, "t1_cues should still be intact after setting mode to 'disabled' again");
    assert_equals(t1_cues[0].id, "id", "t1_cues first cue should still be intact after setting mode to 'disabled' again");
    assert_equals(t1_cues[1].id, "id2", "t1_cues second cue should still be intact after setting mode to 'disabled' again");
    t1.mode = 'showing';
    assert_equals(t1.cues, t1_cues, "t1.cues should return the same object after setting mode to 'disabled' and then 'showing'");
}, document.title+', different modes');

test((){
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    var t1_cues = t1.cues;
    var c = addCue(t1, 0, 1, 'text', 'id');
    var c2 = addCue(t1, 1, 2, 'text2', 'id2');
    t1.mode = 'showing';
    t1.cues[1].startTime = 0; // this should change the text track cue order
    assert_equals(t1.cues[0].id, 'id2');
    assert_equals(t1.cues[1].id, 'id');
    t1.cues[0].startTime = 0.5; // this should change it back
    assert_equals(t1.cues[0].id, 'id');
    assert_equals(t1.cues[1].id, 'id2');
}, document.title+', changing order');

test((){
    asyncStart();
    var video = document.createElement('video') as VideoElement;
    var t1 = video.addTextTrack('subtitles');
    var t1_cues = t1.cues;
    t1.mode = 'showing';
    var track = document.createElement('track') as TrackElement;
    print("111");
    track.setAttribute('default', 'true');
    print("222");
    video.append(track); // queues a task to "honor user preferences...", media element event task source
    var t2 = track.track;
    assert_equals(t2.cues, null, 't2.cues should be null');
    // We need to wait until the "honor user preferences..." steps have run so we invoke play()
    // which queues an event with the same task source.
    video.onPlay.last.then((event){
        assert_equals(t2.cues, t2.cues, 't2.cues should return same object');
        assert_not_equals(t1.cues, t2.cues, 't1.cues and t2.cues should be different objects');
        assert_not_equals(t2.cues, null, 't2.cues should not be null');
        assert_true(t2.cues is TextTrackCueList, 't2.cues is TextTrackCueList');
        assert_equals(t2.cues.length, 0, 't2.cues should have length 0');
        asyncEnd();
    });
    video.play(); // queues a task to fire 'play', media element event task source
}, document.title+', default attribute');

   checkTestFailures();
}
