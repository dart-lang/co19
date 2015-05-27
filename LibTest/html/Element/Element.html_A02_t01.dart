/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Element.html(String html, {NodeValidator validator,
 *  NodeTreeSanitizer treeSanitizer})
 * The HTML fragment should contain only one single root element, any leading
 * or trailing text nodes will be removed.
 * @description Checks that leading and trailing nodes are removed.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('''foo
      <div id="foo"></div>
      bar''');
  Expect.isTrue(x is DivElement);
}
