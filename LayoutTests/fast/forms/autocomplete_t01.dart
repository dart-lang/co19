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

main() {
  document.body.setInnerHtml('''
      This tests that the 'autocomplete' attribute of form and input elements is bound to a JavaScript property.
      <form id="form">
          <input type="text" id="field" />
      </form>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  test() {
    var form = document.getElementById('form');
    var field = document.getElementById('field');

    shouldBeNull(form.getAttribute('autocomplete'));
    shouldBeNull(field.getAttribute('autocomplete'));

    shouldBeEqualToString(form.autocomplete, "on");
    shouldBeEqualToString(field.autocomplete, "");

    form.autocomplete = 'off'; shouldBeEqualToString(form.getAttribute('autocomplete'), "off");
    field.autocomplete = 'off'; shouldBeEqualToString(field.getAttribute('autocomplete'), "off");
    form.setAttribute('autocomplete', 'on'); shouldBeEqualToString(form.autocomplete, "on");
    field.setAttribute('autocomplete', 'on'); shouldBeEqualToString(field.autocomplete, "on");
    form.setAttribute('autocomplete', 'indeterminate'); shouldBeEqualToString(form.autocomplete, "on");
    field.setAttribute('autocomplete', 'indeterminate'); shouldBeEqualToString(field.autocomplete, "indeterminate");
  }

  test();
}
