/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test tickles a subtle off-by-one bug in how the CSS lexer
 * handles end of buffer conditions. The contents of the style tag satisfy
 * (length mod 8 = 2) and contain an unclosed curly brace. We pass if we don't
 * crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>tenbytes {</style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
}
