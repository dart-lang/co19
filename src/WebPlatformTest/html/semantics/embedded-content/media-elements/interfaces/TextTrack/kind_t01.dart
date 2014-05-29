/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/TextTrack/kind.html
 * @assertion 
 * @description TextTrack.kind
 */
import 'dart:html';
import "../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var video = document.createElement('video');
    var t1 = video.addTextTrack('subtitles');
    var t2 = video.addTextTrack('captions');
    var t3 = video.addTextTrack('descriptions');
    var t4 = video.addTextTrack('chapters');
    var t5 = video.addTextTrack('metadata');
    assert_equals(t1.kind, 'subtitles');
    assert_equals(t2.kind, 'captions');
    assert_equals(t3.kind, 'descriptions');
    assert_equals(t4.kind, 'chapters');
    assert_equals(t5.kind, 'metadata');
}, document.title+', addTextTrack');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'CAPTIONS');
    var t = track.track;
    assert_equals(t.kind, 'captions');
}, document.title+', track element');

test((){
    var track = document.createElement('track');
    track.kind = 'captions\u0000';
    assert_equals(track.track.kind, 'subtitles');
}, document.title+', \\u0000');

   checkTestFailures();
}
