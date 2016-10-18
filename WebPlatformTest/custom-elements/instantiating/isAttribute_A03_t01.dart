/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion If both types of custom element types are provided at the time
 * of element's instantiation, the custom tag must win over the type extension.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

class Foo1 extends HtmlElement {
  Foo1.created() : super.created();
}

class Foo2 extends HtmlElement {
  Foo2.created() : super.created();
}

main() {
  document.register('x-foo-1', Foo1);
  document.register('x-foo-2', Foo2);
  document.body.setInnerHtml('<x-foo-1 id="xfoo" is="x-foo-2"></x-foo-1>',
      treeSanitizer: new NoCheck());
    
  var x = document.query('#xfoo');
  Expect.isTrue(x is Foo1);
}
