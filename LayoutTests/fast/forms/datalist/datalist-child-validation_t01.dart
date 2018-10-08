/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for child elements of a datalist element.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <datalist id="list">
        <div id=w>
          <input type=text id=e required>
        </div>
        <legend>
          <input id="inLegend" required>
        </legend>
      </datalist>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement e = document.getElementById('e');
  shouldBeFalse(e.willValidate);
  var w = document.getElementById('w');
  w.remove();
  shouldBeTrue(e.willValidate);
  shouldBe(w.querySelector(":invalid"), e);
  e.remove();
  shouldBeTrue(e.willValidate);
  document.body.append(e);
  shouldBeTrue(e.willValidate);
  shouldBe(document.querySelector(":invalid"), e);

  shouldBeFalse((document.getElementById("inLegend") as InputElement).willValidate);
}
