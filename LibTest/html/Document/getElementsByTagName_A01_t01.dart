/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HtmlCollection getElementsByTagName(String localName)
 * Returns a list of elements with the given tag name.
 * @description Checks that a list of elements with the given tag name is returned.
 * @needsreview dart issue #18240 Document.getElementsByTagName returns NodeList, not HtmlCollection
 */
import "dart:html";
import "../../../Utils/expect.dart";

const myTag = "div";

main() {
  HtmlCollection lst = document.getElementsByTagName(myTag);
  int l0 = lst.length;

  var x1 = new Element.tag(myTag);
  var y = new Element.tag(myTag);
  y.append(x1);
  document.body.append(y);
  lst = document.getElementsByTagName(myTag);
  Expect.equals(l0 + 2, lst.length);

  var x2 = new Element.tag(myTag);
  document.body.append(x2);
  lst = document.getElementsByTagName(myTag);
  Expect.equals(l0 + 3, lst.length);
  // order is not guarateed, so cannot compare lists directly
  Expect.isTrue(lst.contains(x1));
  Expect.isTrue(lst.contains(y));
  Expect.isTrue(lst.contains(x2));
// print("lst is ${lst.runtimeType}; ${lst is HtmlCollection}; ${lst is NodeList}; ${lst is List};");
  Expect.isTrue(lst is HtmlCollection, "is HtmlCollection");
}
