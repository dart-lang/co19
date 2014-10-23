/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests validates that the (color-index) media query feature is supported.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
  <link rel="author" title="Kenneth Christiansen" href="kenneth.r.christiansen@intel.com"/>
  <link rel="help" href="http://www.w3.org/TR/css3-mediaqueries/#color-index"/>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    shouldBe(window.matchMedia('(min-color-index: 1)').matches,
                  !window.matchMedia('(color-index: 0)').matches);

    shouldBe(window.matchMedia('all and (color-index)').matches,
                  !window.matchMedia('not all and (color-index)').matches);
    checkTestFailures();
}
