/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Verify that the priority parameter is a case-insensitive match
 * to 'important' or the empty string.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.innerHtml = '<div id="test">hello</div>';

  var e = document.getElementById('test');

  // Test "important" strictness
  e.style.borderBottomStyle = "";
  e.style.setProperty("border-bottom-style", "solid", "!important");
  //shouldBe(e.style.getPropertyValue('border-bottom-style'), null);
  shouldBe(e.style.getPropertyValue('border-bottom-style'), '');
  shouldBe(e.style.getPropertyPriority('border-bottom-style'), '');

  e.style.borderBottomStyle = "";
  e.style.setProperty("border-bottom-style", "solid", "very important");
  //shouldBe(e.style.getPropertyValue('border-bottom-style'), null);
  shouldBe(e.style.getPropertyValue('border-bottom-style'), '');
  shouldBe(e.style.getPropertyPriority('border-bottom-style'), '');

  e.style.borderBottomStyle = "";
  e.style.setProperty("border-bottom-style", "solid", "impORTANT");
  shouldBe(e.style.getPropertyValue('border-bottom-style'), 'solid');
  shouldBe(e.style.getPropertyPriority('border-bottom-style'), 'important');

  e.style.borderBottomStyle = "";
  e.style.setProperty("border-bottom-style", "solid", "random");
  //shouldBe(e.style.getPropertyValue('border-bottom-style'), null);
  shouldBe(e.style.getPropertyValue('border-bottom-style'), '');
  shouldBe(e.style.getPropertyPriority('border-bottom-style'), '');

  testContainer.remove();
}
