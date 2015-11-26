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
import "../../testharness.dart";

const String htmlEL1 = r'''
    <style>
      :after {
        content: ""
      }
    </style>
''';

const String htmlEL2 = r'''
    <ruby>
      <rt></rt>
    </ruby>
    <ruby style="float: left">
      <rt></rt>
    </ruby>
    This test passes if it doesn't crash.
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    document.body.onLoad.listen((e){document.linkColor=0;});
}