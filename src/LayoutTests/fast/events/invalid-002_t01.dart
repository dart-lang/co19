/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if checkValidity() invoked on a form control
 * correctly asks its elements to fire an invalid event.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <form method="get" id="sad_form">
      <input name="victim" type="text" required/>
      <input name="victim" type="text" pattern="Lorem ipsum" value="Loremipsum"/>
      <textarea name="victim" required></textarea>
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");
  var count = 0;

  for (var elem in v)
    elem.onInvalid.listen((_) => ++count);

  shouldBeFalse(document.getElementById("sad_form").checkValidity());

  shouldBe(count, 3);
}
