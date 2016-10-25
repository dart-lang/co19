/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if it does not CRASH.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      * { border-image: fill; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}

