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
      <a href="http://bugs.webkit.org/show_bug.cgi?id=15252">Bug 15252: &lt;select multiple&gt; doesn't scroll to top when old options are removed and new ones are added, leaving listbox empty-looking</a>

      <p>When the test runs, all the &lt;option&gt;s in the select are removed and replaced with 1 new option. If the bug is present, the select will appear empty until you scroll up with the mousewheel.</p>

      <select id="listbox" size="4">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option selected>6</option>
      </select>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  test2() {
    var select = document.getElementById("listbox");
    while (select.hasChildNodes())
      select.firstChild.remove();

    var option = document.createElement("option");
    option.text = "PASS";
    select.append(option);

    var scrollTop = select.scrollTop;
    shouldBe(scrollTop, 0);

    asyncEnd();
  }

  asyncStart();
  setTimeout(test2, 0);
}
