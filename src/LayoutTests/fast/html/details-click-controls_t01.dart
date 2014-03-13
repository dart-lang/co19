/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    <details id="d">
    <summary>
      <input type="button" value="button" id="buttonControl">
      <input type="text" value="text" id="textControl">
      <textarea value="textarea" id="textareaControl"></textarea>
      <div id="block">This is clickable summary text</div>
    </summary>
    This is a detail.
    </details>
    ''', treeSanitizer: new NullTreeSanitizer());

  clickOn(id)
  {
    var control = document.getElementById(id);
    var x = control.offsetLeft;
    var y = control.offsetTop;
    var delta = 5;
    var elem = document.elementFromPoint(x + delta, y + delta);
    elem.click();
  }

  var details = document.getElementById("d");
  Expect.isFalse(details.open);
  clickOn("buttonControl");
  Expect.isFalse(details.open);
  clickOn("textControl");
  Expect.isFalse(details.open);
  clickOn("textareaControl");
  Expect.isFalse(details.open);
  clickOn("block");
  Expect.isTrue(details.open);
  details.style.display = "none";
}
