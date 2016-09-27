/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final style
 * @description Checks that CSS properties are accessible via style field.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

main() {
  document.body.setInnerHtml(
      '<div style="color: red; direction: rtl">Foo</div>',
      treeSanitizer: new NullTreeSanitizer());
  DivElement x = document.body.firstChild;

  Expect.equals('red', x.style.color, 'color');
  Expect.equals('rtl', x.style.direction, 'direction');
}
