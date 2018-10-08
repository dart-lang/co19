/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if the invalid event is correctly handled by
 * window.oninvalid handler.
 */
import "dart:html";
import "../../testcommon.dart";

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

  var count = 0;

  window.onInvalid.listen((_) => ++count);

  FormElement form = document.getElementById("sad_form");
  shouldBeFalse(form.checkValidity());

  shouldBe(count, 1);
}
