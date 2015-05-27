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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<meta name="viewport" content="width=800">
<style>
  html {
    font-size: 16px;
    line-height: 16px;
  }
  body {
    width: 800px;
    margin: 0;
    overflow-y: hidden;
  }
</style>
''';

const String htmlEL2 = r'''
<span id="span1">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
  nostrud exercitation ullamco laboris nisiut aliquip ex ea commodo consequat.
</span>
<span id="span2"></span>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var forceLayout1 = document.body.offsetTop;
    var span1 = document.getElementById('span1');
    var span2 = document.getElementById('span2');

    span1.firstChild.remove;
    var forceLayout2 = document.body.offsetTop;

    Expect.equals("16px",  span1.getComputedStyle().lineHeight);
    Expect.equals("16px",  span2.getComputedStyle().lineHeight);
}
