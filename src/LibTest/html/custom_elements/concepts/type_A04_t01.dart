/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The custom element type may contain extender char on any
 * position except the first one.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

class Foo extends HtmlElement {
  Foo.created() : super.created();
}

void testName(code) {
  var name = 'x-${new String.fromCharCode(code)}';
  var reportName = 'x-\\u{${code.toRadixString(16)}}';
  try {
    document.register(name, Foo);
  } catch (_) {
    Expect.fail('Failed to register custom element with the name $reportName');
  }
}

main() {
  for (var code in EXTENDER_CHARS) {
    testName(code);
  }
}
