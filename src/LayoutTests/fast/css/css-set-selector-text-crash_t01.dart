/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test passes if it does not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      :target { top: 0; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  CssStyleSheet ss = document.styleSheets[index];
  CssStyleRule sr = ss.cssRules[0];
  sr.selectorText = ':target';
}
