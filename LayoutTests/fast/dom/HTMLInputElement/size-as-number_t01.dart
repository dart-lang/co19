/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests to make sure that HTMLInputElement::size returns 
 * a number, not a string.  This is in violation of the DOM Level 1 spec, but 
 * is what FireFox does, so we match.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <input id="inputElement" size="4">
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  InputElement inputElement = document.getElementById("inputElement");
  shouldBe(inputElement.size, 4);
}
