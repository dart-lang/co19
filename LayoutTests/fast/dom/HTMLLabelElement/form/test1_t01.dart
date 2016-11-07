/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test attempts to access an HTMLLabelElement's form 
 * property. The first test accesses the form property of an label which is
 * inside of a form.  The second test accesses the form property of an label
 * which is not inside of a form
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form id="form">
        <label id="labelInsideForm">
        </label>
    </form>
    
    <label id="labelNotInsideForm">
    </label>
    ''', treeSanitizer: new NullTreeSanitizer());

  LabelElement labelInsideForm = document.getElementById("labelInsideForm");
  LabelElement labelNotInsideForm =
    document.getElementById("labelNotInsideForm");

  FormElement form = document.getElementById("form");

  debug('test inside');
  shouldBe(labelInsideForm.form, form);

  debug('test outside');
  shouldBeNull(labelNotInsideForm.form);
}
