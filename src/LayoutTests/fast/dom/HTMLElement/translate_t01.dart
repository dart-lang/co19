/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the translate attribute.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var parent = document.createElement("div");
  document.body.append(parent);

  testFor(initialAttribute, initialExpectation, setValue, lastExpectation,
      lastAttributeExpectation)
  {
    var target = document.createElement("span");
    parent.append(target);

    target.setAttribute("translate", initialAttribute);
    shouldBe(target.translate, initialExpectation);

    target.translate = setValue;
    shouldBe(target.translate, lastExpectation);
    shouldBe(target.getAttribute('translate'), lastAttributeExpectation);

    target.remove();
  }

  var target = document.createElement("p");
  parent.append(target);

  debug('translate should be "yes" by default.');
  shouldBeTrue(target.translate);
  shouldBeNull(target.getAttribute('translate'));

  debug('\ntarget.translate = false;');
  target.translate = false;
  shouldBeFalse(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "no");

  debug('\ntarget.setAttribute("translate", "yes");');
  target.setAttribute("translate", "yes");
  shouldBeTrue(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "yes");

  debug('\ntarget.setAttribute("translate", "no");');
  target.setAttribute("translate", "no");
  shouldBeFalse(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "no");

  debug('\ntarget.setAttribute("translate", "YES");');
  target.setAttribute("translate", "YES");
  shouldBeTrue(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "YES");

  debug('\ntarget.setAttribute("translate", "NO");');
  target.setAttribute("translate", "NO");
  shouldBeFalse(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "NO");

  debug('\ntarget.setAttribute("translate", "INVALID");');
  target.setAttribute("translate", "INVALID");
  shouldBeTrue(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "INVALID");

  debug("\nRemoving translate attribute.");
  target.attributes.remove("translate");
  shouldBeNull(target.getAttribute('translate'));
  shouldBeTrue(target.translate);

  debug("\nCreating targetChild element as a child of target.");
  var targetChild = document.createElement("span");
  target.append(targetChild);
  shouldBeTrue(targetChild.translate);
  shouldBeNull(targetChild.getAttribute('translate'));

  debug("\nSetting target.translate = false. targetChild should inherit the translate value from its parents.");
  target.translate = false;
  shouldBeFalse(targetChild.translate);
  shouldBeNull(targetChild.getAttribute('translate'));

  debug("\nSetting targetChild.setAttribute('translate', 'INVALID'). Should inherit the translate value from its parents.");
  targetChild.setAttribute("translate", "INVALID");
  shouldBeFalse(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "no");
  shouldBeFalse(targetChild.translate);
  shouldBeEqualToString(targetChild.getAttribute('translate'), "INVALID");

  debug("\ntargetChild.translate = true;");
  targetChild.translate = true;
  shouldBeTrue(targetChild.translate);
  shouldBeEqualToString(targetChild.getAttribute('translate'), "yes");
  shouldBeFalse(target.translate);
  shouldBeEqualToString(target.getAttribute('translate'), "no");

  target.remove();

  debug("");

  testFor("yes", true, false, false, "no");
  testFor("yes", true, true, true, "yes");
  //testFor("yes", true, 0, false, "no");
  //testFor("yes", true, 1, true, "yes");
  //testFor("yes", true, "invalid", true, "yes");
  //testFor("yes", true, "false", true, "yes");

  testFor("no", false, false, false, "no");
  testFor("no", false, true, true, "yes");
  //testFor("no", false, 0, false, "no");
  //testFor("no", false, 1, true, "yes");
  //testFor("no", false, "invalid", true, "yes");
  //testFor("no", false, "false", true, "yes");

  // various initial values
  testFor("", true, true, true, "yes");
  testFor("YES", true, true, true, "yes");
  testFor("NO", false, false, false, "no");
  testFor("invalid", true, true, true, "yes");
  testFor("no  ", true, true, true, "yes");
  testFor("no  ", true, false, false, "no");
  testFor("0", true, false, false, "no");
  testFor("1", true, false, false, "no");
}
