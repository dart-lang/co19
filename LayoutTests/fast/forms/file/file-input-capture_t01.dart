/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the capture attribute of <input type='file'>
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement("input") as InputElement;

  shouldBe(input.capture, null);
  shouldBe(input.attributes.containsKey('capture'), false);

  input.setAttribute("type", "file");

  shouldBe(input.capture, null);
  shouldBe(input.attributes.containsKey('capture'), false);

  input.setAttribute("capture", "true");
  shouldBe(input.capture, "true");
  shouldBe(input.attributes.containsKey('capture'), true);

  input.attributes.remove("capture");
  shouldBe(input.capture, null);
  shouldBe(input.attributes.containsKey('capture'), false);

  input.setAttribute("capture", "'x'");
  shouldBe(input.capture, "'x'");
  shouldBe(input.attributes.containsKey('capture'), true);

  input.capture = "false";
  shouldBe(input.capture, "false");
  shouldBe(input.attributes.containsKey('capture'), false);

  input.capture = "true";
  shouldBe(input.capture, "true");
  shouldBe(input.attributes.containsKey('capture'), true);
}
