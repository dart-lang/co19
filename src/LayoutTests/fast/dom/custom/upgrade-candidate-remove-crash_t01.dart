/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that an element is not upgraded after being destroyed
 */
import "dart:html";
import "../../../testcommon.dart";

class A extends SpanElement {
  static const tag = 'x-a';
  factory A() => new Element.tag('span', tag);
  A.created() : super.created() {
    testFailed('unreachable');
  }
}

main() {
  // Create an upgrade candidate. Don't wrap it.
  var div = document.createElement('div');
  div.setInnerHtml('<span is="x-a"></span>', treeSanitizer: new NullTreeSanitizer());

  // Delete the upgrade candidate.
  div.innerHtml = '';

  // Provide a definition that would have matched.
  document.register('x-a', A, extendsTag: 'span');

  testPassed('Did not crash.');
}
