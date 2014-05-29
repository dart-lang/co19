/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/srclang.html
 * @assertion 
 * @description HTMLMediaElement.srclang
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('srclang', '');
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), '');
}, document.title + ' empty string content attribute');

test((){
    var track = document.createElement('track');
    track.srclang = '';
    assert_equals(track.srclang, '');
    assert_equals(track.getAttribute('srclang'), '');
}, document.title + ' empty string IDL attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('srclang', 'foo');
    assert_equals(track.srclang, 'foo');
    assert_equals(track.getAttribute('srclang'), 'foo');
}, document.title + ' lowercase content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('srclang', 'FOO');
    assert_equals(track.srclang, 'FOO');
    assert_equals(track.getAttribute('srclang'), 'FOO');
}, document.title + ' uppercase content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('srclang', '\u0000');
    assert_equals(track.srclang, '\u0000');
    assert_equals(track.getAttribute('srclang'), '\u0000');
}, document.title + ' \\u0000 content attribute');

test((){
    var track = document.createElement('track');
    track.srclang = 'foo';
    assert_equals(track.srclang, 'foo');
    assert_equals(track.getAttribute('srclang'), 'foo');
}, document.title + ' lowercase IDL attribute');

test((){
    var track = document.createElement('track');
    track.srclang = 'FOO';
    assert_equals(track.srclang, 'FOO');
    assert_equals(track.getAttribute('srclang'), 'FOO');
}, document.title + ' uppercase IDL attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('srclang', ' foo \n');
    assert_equals(track.srclang, ' foo \n');
    assert_equals(track.getAttribute('srclang'), ' foo \n');
}, document.title + ' whitespace in content attribute');

test((){
    var track = document.createElement('track');
    track.srclang = ' foo \n';
    assert_equals(track.srclang, ' foo \n');
    assert_equals(track.getAttribute('srclang'), ' foo \n');
}, document.title + ' whitespace in IDL attribute');

test((){
    var track = document.createElement('track');
    track.srclang = '\u0000';
    assert_equals(track.srclang, '\u0000');
    assert_equals(track.getAttribute('srclang'), '\u0000');
}, document.title + ' \\u0000 in IDL attribute');

   checkTestFailures();
}
