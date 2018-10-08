/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the indexed setter and getter for HTMLOptionsCollection.
 * @needsreview Why options return an unmodifiable list
 * Exception: Unsupported operation: Cannot add to an unmodifiable list
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form name="my_form">
    <select name="set_sel">
        <option id='opt'>========</option>
    </select>

    <select name="get_sel">
        <option id="one">option 1</option>
        <option id="two">option 2</option>
    </select>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  (document.getElementsByName('set_sel')[0] as SelectElement).
      options.add(new OptionElement(data: "A"));
  //document.my_form.set_sel.options[2] = new Option("B");
  //shouldBe("my_form.set_sel.options.length", "3");

  //var options = document.my_form.get_sel.options;
  //shouldBe(options[0], document.getElementById('one'));
  //shouldBe(options[1], document.getElementById('two'));
}
