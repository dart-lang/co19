/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/extTracks.html
 * @assertion 
 * @description HTMLMediaElement.textTracks
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {
  var video = document.createElement('video');
  assert_equals(video.textTracks, video.textTracks);
  assert_equals(video.textTracks.length, 0);
}