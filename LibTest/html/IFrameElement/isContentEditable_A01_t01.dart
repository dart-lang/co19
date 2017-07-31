/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isContentEditable
 * Indicates whether or not the content of the element can be edited. Read only.
 * WHATWG: The contenteditable attribute is an enumerated attribute whose
 * keywords are the empty string, true, and false. The empty string and the
 * true keyword map to the true state. The false keyword maps to the false
 * state. In addition, there is a third state, the inherit state, which is the
 * missing value default (and the invalid value default).
 * @description Checks expected attribute settings
 * @issue #17456
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<iframe></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.isFalse(x.isContentEditable, 'default');

  x = new Element.html('<iframe contenteditable="false"></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.isFalse(x.isContentEditable, 'explicit false');

  x = new Element.html('<iframe contenteditable="true"></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.isTrue(x.isContentEditable, 'explicit true');

  x = new Element.html('<iframe contenteditable=""></iframe>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.isTrue(x.isContentEditable, 'empty string is true');
}
