/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      PASS
      ''', treeSanitizer: new NullTreeSanitizer());

  finishTest()
  {
    document.getElementById("bar");
    asyncEnd();
  }

  HtmlElement element =
      document.body.append(document.createElementNS("foo", "bar"));
  element.id = "bar";
  element.setAttribute("id", "bar");
  element.remove();
  element = null;
  gc();

  asyncStart();
  setTimeout(finishTest, 0);
}
