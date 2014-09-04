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
  }
  body {
    width: 800px;
    margin: 0;
    overflow-y: hidden;
  }
  #inlineToBlock {
    display: inline;
    width: 200px;
    line-height: 30px;
    font-size: 30px;
  }
</style>
''';

const String htmlEL2 = r'''
<span id="inlineToBlock">
  <div>
    This test verifies that lineHeight values are consistent after display changes.
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
    nostrud exercitation ullamco laboris nisiut aliquip ex ea commodo consequat.
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
    nostrud exercitation ullamco laboris nisiut aliquip ex ea commodo consequat.
  </div>
</span>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var forceLayout1 = document.body.offsetTop;
    var inlineToBlock = document.getElementById('inlineToBlock');
    inlineToBlock.style.display = "block";
    var forceLayout2 = document.body.offsetTop;
    Expect.equals("30px",  inlineToBlock.getComputedStyle().lineHeight);
}
