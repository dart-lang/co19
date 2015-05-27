/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var cases = [
    "http://example.com/foo/bar",
    "HTTP://example.com/foo/bar",
    "https://example.com/ttt?ggg",
    "ftp://example.com/ttt?ggg",
    "file:///home/abarth",
    "data:text/html,<b>foo</b>"
  ];
  var expected = [
    "http://example.com",
    "http://example.com",
    "https://example.com",
    "ftp://example.com",
    "file://",
    "null"
  ];

  for (var i = 0; i < cases.length; ++i) {
    var a = document.createElement('a');
    a.href = cases[i];
    a.text = 'Link';
    document.body.append(a);
    document.body.append(document.createElement('br'));
  }

  var elmts = document.getElementsByTagName('a');
  for (var i = 0; i < elmts.length; ++i) {
    shouldBe(elmts[i].origin, expected[i]);
  }
}
