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
 * @assertion The custom element type can be given to a custom element at the
 * time of its instantation as the local name of the custom element.
 */


import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

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
  
  var x = document.createElement('x-foo-1');
  Expect.equals('x-foo-1', x.localName);
  
  document.body.setInnerHtml('<x-foo-2 id="xfoo2"></x-foo-2>',
      treeSanitizer: new NoCheck());
    
  x = document.query('#xfoo2');
  Expect.equals('x-foo-2', x.localName);
}
