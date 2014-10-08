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
import "../../../Utils/async_utils.dart";

main() {
  var el = document.createElement("input");
  el.setAttribute("type", "checkbox");
  shouldBe(el.value, "on");
  el.setAttribute("value", "foo");
  shouldBe(el.value, "foo");
  el.checked = true;
  shouldBe(el.value, "foo");
  el.attributes.remove("value");
  shouldBe(el.value, "on");
  el.value = "foo";
  shouldBe(el.getAttribute("value"), "foo");
}
