/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/interfaces/HTMLElement/HTMLMediaElement/kind.html
 * @assertion 
 * @description HTMLMediaElement.kind
 */
import 'dart:html';
import "../../../../../../../Utils/expectWeb.dart";

void main() {

test((){
    var track = document.createElement('track');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), null);
}, document.title + ' missing value');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'invalid');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'invalid');
}, document.title + ' invalid value in content attribute');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'CAPTIONS');
    assert_equals(track.kind, 'captions');
    assert_equals(track.getAttribute('kind'), 'CAPTIONS');
}, document.title + ' content attribute uppercase');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'CAPT\u0130ONS');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'CAPT\u0130ONS');
}, document.title + ' content attribute with uppercase turkish I (with dot)');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'capt\u0131ons');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'capt\u0131ons');
}, document.title + ' content attribute with lowercase turkish i (dotless)');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'subtitles');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'subtitles');
}, document.title + ' content attribute "subtitles"');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'captions');
    assert_equals(track.kind, 'captions');
    assert_equals(track.getAttribute('kind'), 'captions');
}, document.title + ' content attribute "captions"');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'descriptions');
    assert_equals(track.kind, 'descriptions');
    assert_equals(track.getAttribute('kind'), 'descriptions');
}, document.title + ' content attribute "descriptions"');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'chapters');
    assert_equals(track.kind, 'chapters');
    assert_equals(track.getAttribute('kind'), 'chapters');
}, document.title + ' content attribute "chapters"');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'metadata');
    assert_equals(track.kind, 'metadata');
    assert_equals(track.getAttribute('kind'), 'metadata');
}, document.title + ' content attribute "metadata"');

test((){
    var track = document.createElement('track');
    track.setAttribute('kind', 'captions\u0000');
    assert_equals(track.kind, 'subtitles');
    assert_equals(track.getAttribute('kind'), 'captions\u0000');
}, document.title + ' content attribute "captions\\u0000"');

test((){
    var track = document.createElement('track');
    track.kind = 'subtitles';
    assert_equals(track.getAttribute('kind'), 'subtitles');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute to "subtitles"');

test((){
    var track = document.createElement('track');
    track.kind = 'captions';
    assert_equals(track.getAttribute('kind'), 'captions');
    assert_equals(track.kind, 'captions');
}, document.title + ' setting IDL attribute to "captions"');

test((){
    var track = document.createElement('track');
    track.kind = 'descriptions';
    assert_equals(track.getAttribute('kind'), 'descriptions');
    assert_equals(track.kind, 'descriptions');
}, document.title + ' setting IDL attribute to "descriptions"');

test((){
    var track = document.createElement('track');
    track.kind = 'chapters';
    assert_equals(track.getAttribute('kind'), 'chapters');
    assert_equals(track.kind, 'chapters');
}, document.title + ' setting IDL attribute to "chapters"');

test((){
    var track = document.createElement('track');
    track.kind = 'metadata';
    assert_equals(track.getAttribute('kind'), 'metadata');
    assert_equals(track.kind, 'metadata');
}, document.title + ' setting IDL attribute to "metadata"');

test((){
    var track = document.createElement('track');
    track.kind = 'CAPTIONS';
    assert_equals(track.getAttribute('kind'), 'CAPTIONS');
    assert_equals(track.kind, 'captions');
}, document.title + ' setting IDL attribute to "CAPTIONS"');

test((){
    var track = document.createElement('track');
    track.kind = 'CAPT\u0130ONS';
    assert_equals(track.getAttribute('kind'), 'CAPT\u0130ONS');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with uppercase turkish I (with dot)');

test((){
    var track = document.createElement('track');
    track.kind = 'capt\u0131ons';
    assert_equals(track.getAttribute('kind'), 'capt\u0131ons');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with lowercase turkish I (dotless)');

test((){
    var track = document.createElement('track');
    track.kind = 'captions\u0000';
    assert_equals(track.getAttribute('kind'), 'captions\u0000');
    assert_equals(track.kind, 'subtitles');
}, document.title + ' setting IDL attribute with \\u0000');

   checkTestFailures();
}
