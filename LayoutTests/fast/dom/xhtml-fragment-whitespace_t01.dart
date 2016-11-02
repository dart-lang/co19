/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Incorrect node type for whitespace when setting innerHTML in an
 * XHTML document.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = new DomParser()
    .parseFromString('''
      <html xmlns="http://www.w3.org/1999/xhtml">
      <body>
          <div id="target"></div>
      </body>
      </html>
      ''', 'text/xml');

  var target = doc.getElementById('target');

  target.innerHtml += "\t&lt;p>&lt;/p>";
  shouldBe(target.firstChild.nodeName, "#text");
}
