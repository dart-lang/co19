/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks validity.valueMissing with some values or
 * options with some values selected.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id=parent>
      <input id="input" name="victim" value="something" required/>
      <textarea id="textarea" name="victim" required>something</textarea>
      <select id="select-with-placeholder" name="victim" required>
        <option value="" />
        <option value="X" selected>X</option>
      </select>
      <select id="select-without-placeholder" name="victim" required>
        <option value="X" selected>X</option>
        <option value="" />
      </select>
      <select id="select-with-fake-placeholder-size2" name="victim" size="2" required>
        <option value="" />
        <option value="X" selected>X</option>
      </select>
      <select id="select-without-fake-placeholder-size2" name="victim" size="2" required>
        <option value="X" selected>X</option>
        <option value="" />
      </select>
      <select id="select-with-fake-placeholder-multiple" name="victim" multiple required>
        <option value="" />
        <option value="X" selected>X</option>
      </select>
      <select id="select-without-fake-placeholder-multiple" name="victim" multiple required>
        <option value="X" selected>X</option>
        <option value="" />
      </select>
      <select id="select-with-fake-placeholder-size2-multiple" name="victim" multiple size="2" required>
        <option value="" />
        <option value="X" selected>X</option>
      </select>
      <select id="select-without-fake-placeholder-size2-multiple" name="victim" multiple size="2" required>
        <option value="X" selected>X</option>
        <option value="" />
      </select>
      <select id=select-selecting-by-key required>
        <option value="" selected/>
        <option>a</option>
      </select>
      <select id=select-selecting-by-key-2 required>
        <option value="" selected/>
        <option accesskey="1">a</option>
      </select>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  valueMissingFor(id) {
    return document.getElementById(id).validity.valueMissing;
  }

  shouldBeFalse(valueMissingFor("input"));
  shouldBeFalse(valueMissingFor("textarea"));
  shouldBeFalse(valueMissingFor("select-with-placeholder"));
  shouldBeFalse(valueMissingFor("select-without-placeholder"));
  shouldBeFalse(valueMissingFor("select-with-fake-placeholder-size2"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-size2"));
  shouldBeFalse(valueMissingFor("select-with-fake-placeholder-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-multiple"));
  shouldBeFalse(valueMissingFor("select-with-fake-placeholder-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-size2-multiple"));

  document.getElementById('parent').remove();
}
