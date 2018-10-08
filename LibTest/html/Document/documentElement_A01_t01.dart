/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Element documentElement
 * Returns the Element that is a direct child of document.
 * For HTML documents, this is normally the HTML element.
 * @description Checks the content of documentElement.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var de = document.documentElement;
  Expect.isTrue(de is HtmlHtmlElement, "${de.runtimeType}!=HtmlHtmlElement");
}
