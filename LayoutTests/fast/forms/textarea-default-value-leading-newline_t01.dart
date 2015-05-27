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
  document.body.setInnerHtml('''
      <p>This test attempts to set a leading newline in a text area's default value.</p>
      <p>If the test passes, you should see a 3 lines saying "Passed" below.</p>
      <hr>
      <form>
          <textarea id="text"></textarea>
      </form>
      <hr>
      <p><ol id="console"></ol></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var elt = document.getElementById("text");
  elt.defaultValue = "\ntesting";
  shouldBe(elt.defaultValue, "\ntesting");
  elt.defaultValue = "\n\ntesting";
  shouldBe(elt.defaultValue, "\n\ntesting");
  elt.defaultValue = "\n\n\ntesting";
  shouldBe(elt.defaultValue, "\n\n\ntesting");
  elt.defaultValue = "";
}
