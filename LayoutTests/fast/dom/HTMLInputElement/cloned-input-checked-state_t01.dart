/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * Test for bug 34520: Assertion failure in CheckedRadioButtons::removeButton
 * when using jQuery 1.4.1. Also tests actual behavior the crashing jQuery
 * was test was checking for.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  debug('Test 1');
  var div = document.createElement("div");
  div.innerHtml = "<input type='radio' name='radiotest' checked='checked'/>";

  var fragment = document.createDocumentFragment();
  fragment.append(div.firstChild);

  InputElement clonedInput = fragment.clone(true).clone(true).lastChild;
  shouldBeTrue(clonedInput.checked
      && clonedInput.getAttribute("checked") == "checked");

  debug('Test 2');
  div = document.createElement("div");
  div.innerHtml = "<input type='radio' name='radiotest' checked='checked'/>";
  (div.firstChild as InputElement).checked = false;

  fragment = document.createDocumentFragment();
  fragment.append(div.firstChild);

  clonedInput = fragment.clone(true).clone(true).lastChild;
  shouldBeTrue(!clonedInput.checked
      && clonedInput.getAttribute("checked") == "checked");

  debug('Test 3');
  div = document.createElement("div");
  div.innerHtml = "<input type='radio' name='radiotest'/>";
  (div.firstChild as InputElement).checked = true;

  fragment = document.createDocumentFragment();
  fragment.append(div.firstChild);

  clonedInput = fragment.clone(true).clone(true).lastChild;
  shouldBeTrue(clonedInput.checked
      && clonedInput.getAttribute("checked") == null);
}
