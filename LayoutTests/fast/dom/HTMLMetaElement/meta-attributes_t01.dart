/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.head.append(new Element.html(
    '<meta id="test" name="foo" scheme="bar" http-equiv="content-type" content="text/html; charset=UTF-8">',
    treeSanitizer: new NullTreeSanitizer()));

  MetaElement metaTag = document.getElementById("test");
  shouldBeTrue(metaTag is MetaElement);
  shouldBe(metaTag.name, "foo");
  //shouldBe(metaTag.scheme, "bar");
  shouldBe(metaTag.httpEquiv, "content-type");
  shouldBe(metaTag.content, "text/html; charset=UTF-8");
}
