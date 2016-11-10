/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for the datalist element.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <datalist id="dl1">
       The choices are
       <option>value1</option>, 
       <option value="value2">label2</option>,
       <option label="label3">value3</option>, and
       <option id="o4">value4</option>.
       <option></option>
      </datalist>
      ''', treeSanitizer: new NullTreeSanitizer());

  DataListElement datalist = document.getElementById('dl1') as DataListElement;
  // An option element with empty value is not included.
  shouldBe(datalist.options.length, 4);

  (document.getElementById('o4') as OptionElement).disabled = true;
  // A disabled option element is not included.
  shouldBe(datalist.options.length, 3);
  // After datalist is implemented, the expected text should not contain the
  // text in the datalist element.
}
