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
 * after web-platform-tests/html/semantics/embedded-content/the-audio-element/audio_constructor.html
 * @assertion 
 * @description AudioElement constructor
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";


void main() {

  var src="$testSuiteRoot/media/sound_5.mp3";
  
  var tests = [
    [() { return new AudioElement() ;}, null, "No arguments, with new"],
    [() { return new AudioElement("") ;}, "", "Empty string argument, with new"],
    [() { return new AudioElement(src) ;}, src, "Non-empty string argument, with new"],
    [() { return new AudioElement(null) ;}, null, "Null argument, with new"],
  ];

  tests.forEach((t) {
    Function fn = t[0];
    var expectedSrc = t[1], description = t[2];
    test(() {
      var element = fn();
      assert_equals(element.localName, "audio");
      assert_equals(element.tagName, "AUDIO");
      assert_equals(element.namespaceUri, "http://www.w3.org/1999/xhtml");
      assert_equals(element.nodeType, Node.ELEMENT_NODE);
      assert_equals(element.getAttribute("preload"), "auto");
      assert_equals(element.getAttribute("src"), expectedSrc);
      assert_equals(element.ownerDocument, document);
    }, description);
  });

   checkTestFailures();
}
