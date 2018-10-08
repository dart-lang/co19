/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="insert"></div>
      <div>
        <div>
          <style scoped>
            span {
                color: grey;
            }
          </style>
          <span id="target"></span>
        </div>
        <style scoped>
          span {
              border: 1px solid green;
          }
        </style>
      </div>
      <pre id='console'></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var style = document.createElement('style');
  style.append(new Text('span { color: green; }'));
  document.getElementById('insert').append(style);

  borderColor(id) {
    return getComputedStyle(document.getElementById(id)).borderColor;
  }

  description('Test a case whether order of scoping nodes is different from order of style elements.');
  shouldBe(document.styleSheets.length, 4);
  List<CssStyleSheet> ss = document.styleSheets;
  shouldBe(ss[1].cssRules[0].cssText, "span { color: green; }");
  shouldBe(ss[2].cssRules[0].cssText, "span { color: grey; }");
  shouldBe(ss[3].cssRules[0].cssText, "span { border: 1px solid green; }");
  shouldBe(borderColor("target"), "rgb(0, 128, 0)");
}
