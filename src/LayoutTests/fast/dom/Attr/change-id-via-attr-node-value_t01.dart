/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that different ways of changing an element's id all work
 * properly.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var body = document.body;
  body.id = 'a';

  //debug("\n1. Check id after parsing.");
  Expect.equals(body, document.getElementById("a"));
  Expect.equals("a", body.getAttribute("id"));
  Expect.equals("a", body.attributes["id"]);

  //debug("\n2. Change via attributes");
  body.attributes["id"] = "b";
  Expect.equals(null, document.getElementById("a"));
  Expect.equals(body, document.getElementById("b"));
  Expect.equals("b", body.getAttribute("id"));

  //debug("\n3. Change HTMLElement.id.");
  body.id = "c";
  Expect.equals(null, document.getElementById("b"));
  Expect.equals(body, document.getElementById("c"));
  Expect.equals("c", body.getAttribute("id"));

  //debug("\n4. Change id attribute via setAttribute().");
  body.setAttribute("id", "d");
  Expect.equals(null, document.getElementById("c"));
  Expect.equals(body, document.getElementById("d"));
  Expect.equals("d", body.getAttribute("id"));

  //debug("\n5. Change id attribute via setAttributeNS().");
  body.setAttributeNS(null, "id", "e");
  Expect.equals(null, document.getElementById("d"));
  Expect.equals(body, document.getElementById("e"));
  Expect.equals("e", body.getAttribute("id"));
}
