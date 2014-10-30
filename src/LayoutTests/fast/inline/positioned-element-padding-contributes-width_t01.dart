/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
      #container {
        border: 1px solid blue;
        width: 200px;
      }
      span {
        font: 18px Ahem;
        line-height: 30px;
      }
      .item {
        padding-left: 26px;
      }
      .item span {
        position: absolute;
      }
    </style>
''';

const String htmlEL2 = r'''
    <p>https://bugs.webkit.org/show_bug.cgi?id=108226: All the black boxes should be inside the blue rectangle.</p>
    <div id="container" data-expected-height=62>
        <span class="item">XX XX XX</span>
        <span class="item"><span></span>X</span>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    checkLayout('#container');
}
