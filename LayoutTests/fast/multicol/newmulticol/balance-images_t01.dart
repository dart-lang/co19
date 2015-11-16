/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description balancing multicol with max-height
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testharness.dart";

const String htmlEL1 = r'''
    <style>
      img { display:block; height:123px; }
    </style>
''';

const String resources = "$testSuiteRoot/fast/multicol/resources";

const String htmlEL2 = '''
    <p>There should be a 2 by 2 image grid below.</p>
    <div id="mc" style="-webkit-columns:3; columns:3; orphans:1; widows:1; color:olive; background:olive;">
      <img src="$resources/ipad.jpg">
      <img src="$resources/ipad.jpg">
      <img src="$resources/ipad.jpg">
      <img src="$resources/ipad.jpg">
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Element mc=document.getElementById("mc");
    Expect.equals(246, mc.offsetHeight);
    Expect.equals(document.documentElement.clientWidth, document.documentElement.scrollWidth);
}
