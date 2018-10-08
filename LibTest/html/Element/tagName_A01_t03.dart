/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String tagName
 * The name of the tag for the given element.
 * @description Checks tagName of custom element
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

class Foo extends HtmlElement {
  Foo.created() : super.created();
}

main() {
  var tag = 'x-foo';
  document.register(tag, Foo);
  var x =
      new Element.html('<$tag></$tag>', treeSanitizer: new NullTreeSanitizer());

  Expect.equals(tag.toUpperCase(), x.tagName);
}
