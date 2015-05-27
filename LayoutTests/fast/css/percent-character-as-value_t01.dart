/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test for <a href="rdar://problem/6916082">rdar://problem/6916082</a> Incorrect handling of percent sign in a CSS property value.
      </p>
      <p>
          Parsing the color attributes in this test should not crash.
      </p>
      <UL><FONT COLOR="&-1089647509;"></UL><FONT COLOR=%>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
