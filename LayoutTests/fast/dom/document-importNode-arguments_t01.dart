/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * @description This page tests calling document.importNode.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var imported;
  var d = document.createElement("div");
  d.innerHtml = "<span>hello </span><span>world</span>";

  imported = document.importNode(d);
  shouldBe(imported.childNodes.length, 2);
  shouldBe(imported.text, 'hello world');

  imported = document.importNode(d, true);
  shouldBe(imported.childNodes.length, 2);
  shouldBe(imported.text, 'hello world');

  imported = document.importNode(d, false);
  shouldBe(imported.childNodes.length, 0);
  shouldBe(imported.text, '');
}
