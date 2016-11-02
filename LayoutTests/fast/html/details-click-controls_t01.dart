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

  clickOn(String id)
  {
    Element control = document.getElementById(id);
    int x = control.offsetLeft;
    int y = control.offsetTop;
    int delta = 5;
    Element elem = document.elementFromPoint(x + delta, y + delta);
    elem.click();
  }

  DetailsElement details = document.getElementById("d") as DetailsElement;
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
