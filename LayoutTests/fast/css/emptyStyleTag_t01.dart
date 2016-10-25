/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests that we support empty style sheets.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones
  var style = new Element.html('''
      <style></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  shouldBeNonNull(document.styleSheets[index]);
}
