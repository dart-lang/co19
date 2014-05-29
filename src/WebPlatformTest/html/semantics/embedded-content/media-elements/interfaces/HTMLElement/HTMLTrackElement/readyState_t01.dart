/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/readyState.html
 * @assertion 
 * @description HTMLMediaElement.readyState
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {
    var track = document.createElement('track');
    assert_equals(track.readyState, 0);
}