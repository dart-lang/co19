/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks validity.valueMissing of disabled form
 * controls with blank values, blank options selected, or nothing selected.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <input id="input" name="victim" disabled required />
      <textarea id="textarea" name="victim" disabled required></textarea>
      <select id="select-no-option" name="victim" disabled required>
      </select>
      <select id="select-placeholder-selected" name="victim" disabled required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-placeholder" name="victim" disabled required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-placeholder-selected-size2" name="victim" size="2" disabled required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-placeholder-size2" name="victim" size="2" disabled required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-none-selected-multiple" name="victim" multiple disabled required>
        <option value="" />
        <option value="X">X</option>
      </select>
      <select id="select-fake-placeholder-selected-multiple" name="victim" multiple disabled required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-fake-placeholder-multiple" name="victim" multiple disabled required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-none-selected-size2-multiple" name="victim" multiple size="2" disabled required>
        <option value="" />
        <option value="X">X</option>
      </select>
      <select id="select-fake-placeholder-selected-size2-multiple" name="victim" multiple size="2" disabled required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-fake-placeholder-size2-multiple" name="victim" multiple size="2" disabled required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  valueMissingFor(id) {
    return document.getElementById(id).validity.valueMissing;
  }

  var v = document.getElementsByName("victim");

  shouldBeFalse(valueMissingFor("input"));
  shouldBeFalse(valueMissingFor("textarea"));
  shouldBeFalse(valueMissingFor("select-no-option"));
  shouldBeFalse(valueMissingFor("select-placeholder-selected"));
  shouldBeFalse(valueMissingFor("select-without-placeholder"));
  shouldBeFalse(valueMissingFor("select-placeholder-selected-size2"));
  shouldBeFalse(valueMissingFor("select-without-placeholder-size2"));
  shouldBeFalse(valueMissingFor("select-none-selected-multiple"));
  shouldBeFalse(valueMissingFor("select-fake-placeholder-selected-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-multiple"));
  shouldBeFalse(valueMissingFor("select-none-selected-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-fake-placeholder-selected-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-size2-multiple"));
}
