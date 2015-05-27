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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          select::selection { color: red; }
          input[type="button"]::selection { color: red; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This tests that this crasher is fixed:<br>
      http://bugs.webkit.org/show_bug.cgi?id=10139<br>
      REGRESSION: Reproducible crash when selecting a popup/button with ::selection pseudostyle"<br>
      <select>
          <option>Option 1</option>
      </select>
      <input type="button" value="button"></input>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.execCommand("SelectAll", false, '');
}
