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
  var f = new DocumentFragment.html('''
      <style type='text/css'>
          #theSelect { display: none; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  document.body.setInnerHtml('''
      <p>The test below queries the selected property of the option. In both cases it should be selected, just as the result is when the select is visible. Bug 15088</p>

      <select id='theSelect'>
          <option id='theOption'>The Option</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_) {
    OptionElement theOption = document.getElementById('theOption') as OptionElement;
    shouldBe(theOption.selected, true);
    shouldBe((theOption.parentNode as SelectElement).selectedIndex, 0);
    shouldBe(theOption.selected, true);
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(runTest);
}
