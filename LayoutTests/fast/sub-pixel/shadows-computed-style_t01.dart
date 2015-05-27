/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests the computed style for subpixel shadows 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
  #text { text-shadow: 0.5px 1.5px 2.5px red; }
  #box { box-shadow: 0.5px 1.5px 2.5px 3.5px red; }
</style>
''';

const String htmlEL2 = r'''
<div id="text">Text shadow</div>
<div id="box">Box shadow</div>
''';

void main() {
    description("Tests the computed style for subpixel shadows");
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    var text = document.getElementById("text");
    var box = document.getElementById("box");

    var style = text.getComputedStyle(null);
    shouldBe(style.getPropertyValue('text-shadow'),
           'rgb(255, 0, 0) 0.5px 1.5px 2.5px', 'text-shadow');
    style = box.getComputedStyle(null);
    shouldBe(style.getPropertyValue('box-shadow'),
           'rgb(255, 0, 0) 0.5px 1.5px 2.5px 3.5px', 'box-shadow');

    checkTestFailures();
}
