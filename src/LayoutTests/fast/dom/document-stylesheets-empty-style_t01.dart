/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for bug 15649: Empty STYLE elements are not reflected into
 * the document.styleSheets object.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var saveLength = document.styleSheets.length;

  var style = new Element.html('''
    <style></style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.getElementsByTagName('head')[0] .append(document.createElement("style"));

  shouldBe(document.styleSheets.length - saveLength, 2);
}
