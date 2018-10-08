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
      <p>This tests reseting of a select box with no selected options using JavaScript. If successful, both times the selected index should be 0.<form>
      <form>
      <select id="select">
      <option>Option 0</option>
      <option>Option 1</option>
      <option>Option 2</option>
      </select>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select = document.getElementById('select') as SelectElement;
  debug('before reset');
  int index = select.selectedIndex;
  shouldBe(index, 0);
  debug('after reset');
  index = select.selectedIndex;
  shouldBe(index, 0);
}
