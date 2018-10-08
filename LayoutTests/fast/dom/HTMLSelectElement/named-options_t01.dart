/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that option elements are accessible using namedItem
 * from both HTMLSelectElement and HTMLOptionsCollection as well as using the 
 * getter from the HTMLOptionsCollection
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  SelectElement select1 = document.createElement("select");
  document.body.append(select1);
  select1.setInnerHtml('<option value="Value" name="test">',
      treeSanitizer: new NullTreeSanitizer());

  SelectElement select2 = document.createElement("select");
  document.body.append(select2);
  select2.setInnerHtml(
    '<option value="Value1" name="test"><option value="Value2" name="test">',
      treeSanitizer: new NullTreeSanitizer());

  debug("Confirm that the option named 'test' is accessible from the select element");
  shouldBeTrue(select1.namedItem('test') is OptionElement);
  shouldBeEqualToString(select1.namedItem('test').value, "Value");

  debug("Confirm that the option named 'test' is accessible from the options collection");
  // NA to dart
  shouldBeTrue(select1.options[0] is OptionElement);
  shouldBeEqualToString(select1.options[0].value, "Value");

  debug("Confirm that both options named 'test' are accessible from the options collection");
  // NA to dart
  shouldBe(select2.options.length, 2);
  shouldBeEqualToString(select2.options[0].value, "Value1");
  shouldBeEqualToString(select2.options[1].value, "Value2");

  // Clean up after ourselves
  select1.remove();
  select2.remove();
}
