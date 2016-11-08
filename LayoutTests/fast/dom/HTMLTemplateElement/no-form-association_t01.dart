/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Form control elements inside templates should not be associated
 * with forms outside the template
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form style="display:none">
    <template id="one"><input></template>
    </form>
    <template id="two"><form><template><input></template></form></template>
    ''', treeSanitizer: new NullTreeSanitizer());

  debug('Form in document, input inside template:');
  FormElement form = document.querySelector('form');
  TemplateElement template = document.querySelector('#one');
  InputElement input = template.content.querySelector('input');
  shouldBe(form.length, 0);
  shouldBeNull(input.form);

  debug('Form in template, input in sub-template:');
  template = document.querySelector('#two');
  form = template.content.querySelector('form');
  template = template.content.querySelector('template');
  input = template.content.querySelector('input');
  shouldBe(form.length, 0);
  shouldBeNull(input.form);
}
