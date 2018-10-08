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
      <p>This tests that a display:none textarea doesn't crash when submitted in a form.</p>
      <form action="?" id="form">
          <textarea id="textarea" name=value style="-webkit-appearance:textarea" wrap=hard>123456789</textarea>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var url = window.location.href;

  var firstRun = url.indexOf('?') == -1 || !url.contains('?value');

  if (firstRun) {
    document.getElementById("textarea").style.display = "none";
    FormElement form = document.getElementById("form");
    form.submit();
    return;
  }

  debug("PASS: You didn't crash.");
  shouldBe(window.location.search, '?value=123456789');
}
