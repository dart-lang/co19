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
      <p>Test for a bug that RenderBlock crashed when a validation message bubble for a select element with float:left was closing.</p>
      <div id=console></div>
      <form>
      <select style="float:left" required>
      <option value="">Plese select</option>
      <option>Foo</option>
      </select>
      <input type=submit id=submit>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  finish() {
    testPassed('Not crashed.');
    asyncEnd();
  }

  closeBubble() {
    // Make the <select> valid to close the validation message bubble.
    SelectElement select = document.getElementsByTagName('select')[0];
    select.selectedIndex = 1;
    setTimeout(finish, 0);
  }

  asyncStart();
  document.getElementById('submit').click();
  setTimeout(closeBubble, 0);
}
