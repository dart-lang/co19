/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensure that the content element is available.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div>
      <content id="content-simplest"></content>
      PASS
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  ContentElement contentSimplest = document.getElementById("content-simplest");
  shouldBe(contentSimplest.select, '');
  contentSimplest.setAttribute("select", "foo");
  shouldBe(contentSimplest.select, 'foo');
  contentSimplest.select = "bar";
  shouldBe(contentSimplest.getAttribute('select'), 'bar');
  shouldBeTrue(contentSimplest is ContentElement);
}
