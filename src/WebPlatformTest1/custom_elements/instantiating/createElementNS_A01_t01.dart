/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If typeExtension is not present then type is a local name.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  Foo.created() : super.created();
}

main() {
  document.register(Foo.tag, Foo);
  var x = document.createElementNS(HTML_NAMESPACE, Foo.tag);
  Expect.isTrue(x is Foo);
}
