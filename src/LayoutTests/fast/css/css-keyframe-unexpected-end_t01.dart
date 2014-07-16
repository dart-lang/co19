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

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      @-webkit-keyframes anim {
        from { color: green; }
        to { color: red; }
      /* Missing closing brace */
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var rule = document.styleSheets[index].cssRules[0];
  shouldBe(rule.cssRules.length, 2);
}
