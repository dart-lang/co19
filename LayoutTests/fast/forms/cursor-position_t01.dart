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
      <p>This test used to check that the selection start was the same before and after a change to the contents of a textarea.</p>
      <p>However now, in order to match the behavior of the other major browsers, selection is moved to the end of the text value when a change occurs to the contents of a text area.</p>
      <p>Because this would invalidate the previous test, and that the previous test now perfectly shows the new behavior, we repurposed it.</p>
      <br />
      <p>rdar://problem/5423067 gmail is super annoying when trying to add a new name to the TO, CC or BCC fields</p>
      <hr />
      <form>
          <textarea id="text"></textarea>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var elt = document.getElementById("text");
  var txt = "this is\ra test\rof cursor";
  var txt2 = "this is\na test\nof cursor!";

  // test getCursorPosition...
  elt.value = txt;
  elt.setSelectionRange(10, 14);
  elt.focus();
  elt.value = txt2;
  elt.focus();
  shouldBe(elt.selectionStart, 25);
  shouldBe(elt.selectionEnd, 25);

  // test setCursorPosition...
  elt.value = txt2;
  elt.setSelectionRange(10, 14);
  elt.focus();
  elt.value = txt;
  elt.focus();
  shouldBe(elt.selectionStart, 24);
  shouldBe(elt.selectionEnd, 24);
}
