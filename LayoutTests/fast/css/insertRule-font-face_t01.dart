/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test parsing of @font-face rule using insertRule().
 * http://bugs.webkit.org/show_bug.cgi?id=15986
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css"></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var rule = "@font-face { }";
  shouldBe(style.sheet.insertRule(rule, 0), 0);
  shouldBe(style.sheet.rules[0].cssText, rule);
}
