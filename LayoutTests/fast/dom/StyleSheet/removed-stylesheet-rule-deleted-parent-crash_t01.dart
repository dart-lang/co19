/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var index = document.styleSheets.length; // skip existing style sheets

  document.body.setInnerHtml('''
    <div id="result"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  gc()
  {
    for (var i = 0; i < 10000; i++) { // > force garbage collection (FF requires about 9K allocations before a collect)
      var s = new Object();
    }
  }

  var style = document.createElement('style');
  style.text = 'body { color: red }';
  document.head.append(style);

  var ruleList = window.getMatchedCssRules(document.body, '');

  document.styleSheets[index].deleteRule(0);
  style.remove();

  gc();

  if (ruleList[0].parentStyleSheet == null)
    document.getElementById('result').innerHtml = "PASS";
}


