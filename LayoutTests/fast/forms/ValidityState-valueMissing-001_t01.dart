/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks validity.valueMissing with blank values, blank
 * options selected, or nothing selected.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input id="input" name="victim" required/>
      <textarea id="textarea" name="victim" required></textarea>
      <select id="select-no-option" name="victim" required>
      </select>
      <select id="select-placeholder-selected" name="victim" required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-placeholder" name="victim" required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-placeholder-selected-size2" name="victim" size="2" required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-placeholder-size2" name="victim" size="2" required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-none-selected-multiple" name="victim" multiple required>
        <option value="" />
        <option value="X">X</option>
      </select>
      <select id="select-fake-placeholder-selected-multiple" name="victim" multiple required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-fake-placeholder-multiple" name="victim" multiple required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-none-selected-size2-multiple" name="victim" multiple size="2" required>
        <option value="" />
        <option value="X">X</option>
      </select>
      <select id="select-fake-placeholder-selected-size2-multiple" name="victim" multiple size="2" required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-without-fake-placeholder-size2-multiple" name="victim" multiple size="2" required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      <select id="select-optgroup" name="victim" required>
        <optgroup label="1">
          <option value="" selected />
        </optgroup>
        <option value="X">X</option>
      </select>
      <select id="select-disabled-option" name="victim" required>
        <option value="" disabled selected />
        <option value="X">X</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  bool valueMissingFor(String id) {
    return (document.getElementById(id) as InputElementBase).validity.valueMissing;
  }

  var v = document.getElementsByName("victim");

  shouldBeTrue(valueMissingFor("input"));
  shouldBeTrue(valueMissingFor("textarea"));
  shouldBeTrue(valueMissingFor("select-no-option"));
  shouldBeTrue(valueMissingFor("select-placeholder-selected"));
  shouldBeFalse(valueMissingFor("select-without-placeholder"));
  shouldBeFalse(valueMissingFor("select-placeholder-selected-size2"));
  shouldBeFalse(valueMissingFor("select-without-placeholder-size2"));
  shouldBeTrue(valueMissingFor("select-none-selected-multiple"));
  shouldBeFalse(valueMissingFor("select-fake-placeholder-selected-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-multiple"));
  shouldBeTrue(valueMissingFor("select-none-selected-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-fake-placeholder-selected-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-without-fake-placeholder-size2-multiple"));
  shouldBeFalse(valueMissingFor("select-optgroup"));
  shouldBeTrue(valueMissingFor("select-disabled-option"));
}
