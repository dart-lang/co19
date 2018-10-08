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

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  document.body.setInnerHtml('''
    <p>Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=62384">62384</a>: WebCore::WebKitCSSKeyframesRuleInternal::nameAttrSetter() - crash</p>
    <p>This test passed if it did not crash</p>
    <p id="console">FAILED (test not run)</p>
    <style>
        @-webkit-keyframes foo {
            0% {foo: bar;}
        }
    </style>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_){
    CssStyleSheet ss =  document.styleSheets[index];
    dynamic e = ss.cssRules[0];
    e.cssRules.item(0).parentStyleSheet.removeRule(0);
    e.name = 'bar';
    document.getElementById('console').innerHtml = "PASS";
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(test);
}
