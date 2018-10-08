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

main() {
  document.body.setInnerHtml('''
      <p>This test attempts to set non-standard line endings in a text area and reads them back. The line endings should all come back as linefeeds.</p>
      <p>If the test passes, you should see three lines saying "Passed" below.</p>
      <hr />
      <form>
          <textarea id="text"></textarea>
      </form>
      <hr />
      <p><ol id="console"></ol></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement elt = document.getElementById("text") as TextAreaElement;
  elt.value = "This\ris\ra\rtest";
  shouldBe(elt.value, "This\nis\na\ntest");
  elt.value = "And\r\nhere\r\nis\r\ntest\r\ntwo";
  shouldBe(elt.value, "And\nhere\nis\ntest\ntwo");
  elt.value = "And\nlastly,\ntest\nthree";
  shouldBe(elt.value, "And\nlastly,\ntest\nthree");
  elt.value = "";
}
