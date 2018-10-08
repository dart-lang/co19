/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests the spellcheck attribute.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var parent = document.createElement("div");
  document.body.append(parent);

  testFor(initialAttribute, initialExpectation, setValue, lastExpectation,
      lastAttributeExpectation)
  {
    var target = document.createElement("span");
    parent.append(target);

    target.setAttribute("spellcheck", initialAttribute);
    shouldBe(target.spellcheck, initialExpectation);

    target.spellcheck = setValue;
    shouldBe(target.spellcheck, lastExpectation);
    shouldBe(target.getAttribute('spellcheck'), lastAttributeExpectation);

    target.remove();
  }

  testUsingSetAttributes()
  {
    var target = document.createElement("span");
    parent.append(target);

    shouldBe(target.spellcheck, true);
    shouldBe(target.getAttribute('spellcheck'), 'true');
    // Set using property.
    target.spellcheck = false;
    shouldBe(target.spellcheck, false);
    shouldBe(target.getAttribute('spellcheck'), 'false');
    // Set using setAttribute().
    target.setAttribute("spellcheck", "true");
    shouldBe(target.spellcheck, true);
    shouldBe(target.getAttribute('spellcheck'), 'true');

    // Set using setAttribute(), valid but non canonical value.
    target.spellcheck = false; // clear at first
    target.setAttribute("spellcheck", "TRUE");
    shouldBe(target.spellcheck, true);
    shouldBe(target.getAttribute('spellcheck'), 'TRUE');
    // Set using setAttribute(), invalid value.
    target.spellcheck = false; // clear at first
    target.setAttribute("spellcheck", "INVALID");
    shouldBe(target.spellcheck, true);
    shouldBe(target.getAttribute('spellcheck'), 'INVALID');

    target.remove();
  }

  testFor("true", true, false, false, "false");
  testFor("true", true, true, true, "true");
  //testFor("true", true, 0, false, "false");
  //testFor("true", true, 1, true, "true");
  //testFor("true", true, "invalid", true, "true");
  //testFor("true", true, "false", true, "true");

  testFor("false", false, false, false, "false");
  testFor("false", false, true, true, "true");
  //testFor("false", false, 0, false, "false");
  //testFor("false", false, 1, true, "true");
  //testFor("false", false, "invalid", true, "true");
  //testFor("false", false, "false", true, "true");

  // various initial values
  testFor("", true, true, true, "true");
  testFor("TRUE", true, true, true, "true");
  testFor("FALSE", false, false, false, "false");
  testFor("invalid", true, true, true, "true");
  testFor("false  ", true, true, true, "true");
  testFor("false  ", true, false, false, "false");
  testFor("0", true, false, false, "false");
  testFor("1", true, false, false, "false");

  testUsingSetAttributes();
}
