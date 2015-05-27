/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description PASS unless crash
 * @note test causes stack overflow which is considered as "crash" anyway
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => new Element.tag(tag);
  Foo.created() : super.created() {
    this.setInnerHtml("<x-foo>Hello</x-foo>",
        treeSanitizer: new NullTreeSanitizer());
  }
}

main() {
  document.register("x-foo", Foo);
  //document.createElement("x-foo");
}
