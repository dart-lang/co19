/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isContentEditable
 * Indicates whether or not the content of the element can be edited. Read only.
 * WHATWG: The inherit state indicates that the element is editable if its
 * parent is.
 * @description Checks inherited (default) attribute settings
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<div><span><pre></pre></span></div>',
      treeSanitizer: new NullTreeSanitizer());
  var y = x.querySelector('pre');
  Expect.isFalse(x.isContentEditable, 'default');

  x = new Element.html(
      '<div contenteditable="true"><span><pre></pre></span></div>',
      treeSanitizer: new NullTreeSanitizer());
  y = x.querySelector('pre');
  Expect.isTrue(x.isContentEditable, 'inherited true');
}
