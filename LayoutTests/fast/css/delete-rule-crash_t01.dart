/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic style = new Element.html('''
      <style>
      .rule1 {}
      .rule2 {}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  style.sheet.cssRules.item(0);
  style.sheet.deleteRule(1);
}
