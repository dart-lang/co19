/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug 35014 - Modifying UA rules from page JS crashes
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="result">
      PASS
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    var cssRulesList = window.getMatchedCssRules(document.body, "");
    if (cssRulesList != null) 
    {
      var styleToChange = cssRulesList[0].style;
      var originalMarginTop = styleToChange.marginTop;
      styleToChange.marginTop = "200px";
      styleToChange.marginTop = originalMarginTop;
      document.getElementById("result").innerHtml = "FAIL";
    }
  }

  test();
}
