/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * @description On setting document.title to the empty string, no text node
 * must be created
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var doc = new DomParser().parseFromString('''
    <!DOCTYPE html>
    <title>document title and the empty string</title>
    <body>
    </body>
    ''', 'text/html');

  var head = doc.documentElement.firstChild;
  head.firstChild.remove(); // remove title
  shouldBeEqualToString(doc.title, "");
  doc.title = "";
  shouldBeEqualToString(doc.title, "");
  shouldBeTrue(head.lastChild is TitleElement);
  shouldBe(head.lastChild.firstChild, null);
}
