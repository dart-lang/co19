/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/track.html
 * @assertion 
 * @description HTMLMediaElement.track
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {
    var track = document.createElement('track');
    assert_equals(track.track, track.track, 'same object should be returned');
    assert_true(track.track is TextTrack, 'returned object should be a TextTrack');
}
