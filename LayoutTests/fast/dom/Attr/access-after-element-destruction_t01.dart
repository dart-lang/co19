/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that accessing Attr after its Element has been destroyed
 * works without crashing.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var element = document.createElement("p");
  element.setAttribute("a", "b");
  var attributes = element.attributes;
  element = null;

  Expect.equals(1, attributes.length);
  Expect.equals("b", attributes["a"]);
}
