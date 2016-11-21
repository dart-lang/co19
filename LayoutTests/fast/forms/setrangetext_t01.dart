/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test setRangeText() method on common input types.
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/common-setrangetext.dart";

main() {
  runTestsShouldPass("input", { "type": "password" });
  runTestsShouldPass("input", { "type": "tel" });
  runTestsShouldPass("input", { "type": "text" });
  runTestsShouldPass("input", { "type": "text", "dir": "rtl" });
  runTestsShouldPass("input", { "type": "url" });

  debug("<hr>");
  debug("Check that setRangeText() on disconnected elements doesn't crash and has proper values.");
  InputElement element = document.createElement("input") as InputElement;
  element.value = '0123456789';
  element.setRangeText('ABC', start:0, end:0, selectionMode:'select');
  //shouldBeEqualToString(element.value, "ABC0123456789");

  runTestsShouldFail("input", { "type": "button" });
  runTestsShouldFail("input", { "type": "checkbox" });
  runTestsShouldFail("input", { "type": "email" });
  runTestsShouldFail("input", { "type": "radio" });
  runTestsShouldFail("input", { "type": "reset" });
  runTestsShouldFail("input", { "type": "submit" });
}
