/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void setAttribute(String name, String value)
 * Set the value of the named attribute from the current node
 * @description Checks expected attributes values after setting
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  var x = new Element.html('<div id="id" custom="foo"></div>',
      treeSanitizer: new NullTreeSanitizer());

  x.setAttribute('id', 'myid');
  Expect.equals('myid', x.getAttribute('id'), 'change standard attribute');

  x.setAttribute('custom', 'bar');
  Expect.equals('bar', x.getAttribute('custom'), 'change custom attribute');

  x.setAttribute('new', 'one');
  Expect.equals('one', x.getAttribute('new'), 'add new attribute');
}
