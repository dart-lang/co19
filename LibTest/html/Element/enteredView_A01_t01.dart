/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void enteredView()
 * Called by the DOM when this element has been inserted into the live document.
 * @description Checks that enteredView() is called when element is inserted
 * into the live document.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../testcommon.dart";

class Foo extends HtmlElement {
  Foo.created() : super.created();
  enteredView() {
    super.enteredView();
    asyncEnd();
  }
}

main() {
  var tag = 'x-foo';
  document.register(tag, Foo);
  var x = document.body;

  asyncStart();
  x.setInnerHtml('<$tag></$tag>', treeSanitizer: new NullTreeSanitizer());
}
