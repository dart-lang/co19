/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that setting innerHtml on an xhtml document works
 * and respects namespaces and unknown namespace prefixes.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
      <html xmlns="http://www.w3.org/1999/xhtml" xmlns:foo="http://www.example.com/foo">
      <body>
      <p id="test"/>
      </body>
      </html>
      ''', 'text/xml');

  var e = doc.getElementById('test');
  e.setInnerHtml('<b>Success!</b><foo:bar></foo:bar>',
      treeSanitizer: new NullTreeSanitizer());

  debug('firstChild');
  shouldBe(e.firstChild.namespaceUri, 'http://www.w3.org/1999/xhtml');

  debug('lastChild');
  shouldBe(e.lastChild.namespaceUri, 'http://www.example.com/foo');
}
