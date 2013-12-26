/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Namespace for createElement is HTML Namespace.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

class Foo1 extends HtmlElement {
  static const tag = 'x-foo-1';
  Foo1.created() : super.created();
}

class Foo2 extends ParagraphElement {
  static const tag = 'x-foo-2';
  Foo2.created() : super.created();
}

main() {
  document.register(Foo1.tag, Foo1);
  var x = document.createElement(Foo1.tag);
  Expect.equals(HTML_NAMESPACE, x.namespaceUri);

  document.register(Foo2.tag, Foo2, extendsTag: 'p');
  x = document.createElement('p', Foo2.tag);
  Expect.equals(HTML_NAMESPACE, x.namespaceUri);
}
