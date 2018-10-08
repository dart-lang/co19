/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String contentEditable
 * Gets/sets whether or not the element is editable.
 * WHATWG: The contenteditable attribute is an enumerated attribute whose
 * keywords are the empty string, true, and false. The empty string and the
 * true keyword map to the true state. The false keyword maps to the false
 * state. In addition, there is a third state, the inherit state, which is the
 * missing value default (and the invalid value default).
 * @description Checks expected attribute settings
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x =
      new Element.html('<div></div>', treeSanitizer: new NullTreeSanitizer());
  Expect.equals('inherit', x.contentEditable, 'default');

  x = new Element.html('<div contenteditable="false"></div>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.equals('false', x.contentEditable, 'explicit false');

  x = new Element.html('<div contenteditable="true"></div>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.equals('true', x.contentEditable, 'explicit true');

  x = new Element.html('<div contenteditable=""></div>',
      treeSanitizer: new NullTreeSanitizer());
  Expect.equals('true', x.contentEditable, 'empty string is true');
}
