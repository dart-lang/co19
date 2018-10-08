/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void leftView()
 * Called by the DOM when this element has been removed from the live document.
 * @description Checks that leftView() is called when element is removed from
 * the live document.
 */
import "dart:html";
import "../../../Utils/expect.dart";

class Foo extends HtmlElement {
  Foo.created() : super.created();
  leftView() {
    super.leftView();
    asyncEnd();
  }
}

main() {
  var tag = 'x-foo';
  document.register(tag, Foo);

  asyncStart();
  var x = new Element.tag(tag);
  document.body.append(x);
  x.remove();
}
