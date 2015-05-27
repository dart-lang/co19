/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that textarea controls are properly reset.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <textarea id="noDefaultText"></textarea>
    <textarea id="hasDefaultText">Default Text</textarea>
    <input id="resetButton" type="reset">
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  test(element)
  {
    debug(element.id);
    shouldBe(element.value, element.defaultValue);
  }
  var noDefaultText = document.getElementById("noDefaultText");
  var hasDefaultText = document.getElementById("hasDefaultText");
  noDefaultText.value = "Not the default value.";
  hasDefaultText.value = "Not the default value.";
  document.getElementById("resetButton").click();
  test(noDefaultText);
  test(hasDefaultText);
}
