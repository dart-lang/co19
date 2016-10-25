/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that querying the priority for a shorthand works.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.innerHtml = '<div id="test">hello</div>';

  var e = document.getElementById('test');

  // Sanity check.
  e.style.setProperty("border-bottom-style", "solid", "important");
  shouldBe(e.style.getPropertyValue('border-bottom-style'), 'solid');
  shouldBe(e.style.getPropertyPriority('border-bottom-style'), 'important');

  e.style.borderBottomStyle = "";
  e.style.border = "20px solid green";
  shouldBe(e.style.getPropertyValue('border'), '20px solid green');
  shouldBe(e.style.getPropertyPriority('border'), '');

  e.style.border = "";
  e.style.setProperty("border", "20px solid green", "important");
  shouldBe(e.style.getPropertyValue('border'), '20px solid green');
  shouldBe(e.style.getPropertyPriority('border'), 'important');

  testContainer.remove();
}
