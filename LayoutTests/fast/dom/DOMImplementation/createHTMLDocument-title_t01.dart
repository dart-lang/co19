/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for a <href="https://bugs.webkit.org/show_bug.cgi?id=30982">bug 30982</a>: createHTMLDocument doesn't escape ampersand and less-than in title.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var result = document.implementation.createHtmlDocument('foo</title>').title;
  Expect.equals('foo</title>', result);
}
