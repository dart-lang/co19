/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLTrackElement/default.html
 * @assertion 
 * @description HTMLTrackElement.default
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.getAttribute('default'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('default', '');
    assert_equals(track.getAttribute('default'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('default', 'foo');
    assert_equals(track.getAttribute('default'), 'foo');
}, document.title + ' foo in content attribute');

   checkTestFailures();
}
