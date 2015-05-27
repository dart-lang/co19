/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test that adding a noscript tag into a document created
 * using createHTMLDocument doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = document.implementation.createHtmlDocument("");
  doc.documentElement.append(new DocumentFragment.html('''
        <noscript></noscript><canvas></canvas>
        ''', treeSanitizer: new NullTreeSanitizer()));
}
