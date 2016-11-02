/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  BodyElement body = document.body;

  Element style = new Element.html('''
      <style>
        body {
            margin: 0px;
        }
        div {
            width:200px;
            height:80px;
        }
        summary {
            background-color: red;
        }
      </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  body.setInnerHtml('''
    <div style="-webkit-writing-mode:horizontal-tb;">
        <details id="details0"><input></details>
    </div>

    <div style="-webkit-writing-mode:horizontal-bt;">
        <details id="details1"><input></details>
    </div>

    <div style="-webkit-writing-mode:vertical-lr;">
        <details id="details2"><input></details>
    </div>

    <div style="-webkit-writing-mode:vertical-rl;">
        <details id="details3"><input></details>
    </div>

    <div id="results">
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());


  clickElement (int element) {
    DetailsElement detail = document.getElementById("details$element") as DetailsElement;
    bool old = detail.open;

    detail.click();

    Expect.isFalse(old != detail.open);
  }

  clickElement(0);
  clickElement(1);
  clickElement(2);
  clickElement(3);
}
