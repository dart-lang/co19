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
<p id="description">Tests to check behaviors of dirty flag and defaultValue change.</p>
<div id="console"></div>
<form id=form>
<textarea name=textarea id=textarea>
default
</textarea>
</form>
      ''', treeSanitizer: new NullTreeSanitizer());

  FormElement form = document.getElementById('form') as FormElement;
  TextAreaElement textarea = document.getElementById('textarea') as TextAreaElement;

  // Dirty by execCommand(), then setDefaultValue().
  textarea.focus();
  textarea.select();
  document.execCommand("InsertText", false, "user-updated"); shouldBe(textarea.value, "user-updated");
  textarea.defaultValue = "default 2"; shouldBe(textarea.value, "user-updated");
  form.reset(); shouldBe(textarea.value, "default 2");
  textarea.defaultValue = "default 3"; shouldBe(textarea.value, "default 3");

  // Dirty by setValue(), then setDefaultValue().
  textarea.value = "script-updated"; shouldBe(textarea.value, "script-updated");
  textarea.defaultValue = "default 4"; shouldBe(textarea.value, "script-updated");
  form.reset(); shouldBe(textarea.value, "default 4");

  // Dirty by setValue(), then update defaultValue by innerHtml.
  textarea.value = "script-updated"; shouldBe(textarea.value, "script-updated");
  textarea.innerHtml = "default 5"; shouldBe(textarea.value, "script-updated");
  form.reset(); shouldBe(textarea.value, "default 5");
  textarea.innerHtml = "default 6"; shouldBe(textarea.value, "default 6");

  // Dirty by setValue(), then update defaultValue by DOM tree operations.
  textarea.value = "script-updated"; shouldBe(textarea.value, "script-updated");
  textarea.firstChild.remove(); textarea.append(new Text("default 5")); shouldBe(textarea.value, "script-updated");
  form.reset(); shouldBe(textarea.value, "default 5");
  textarea.firstChild.remove(); textarea.append(new Text("default 6")); shouldBe(textarea.value, "default 6");
  form.innerHtml = '';
}
