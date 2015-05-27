/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that shorthand properties can be removed via CSSOM.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var shorthandProperties = [
    "font",
    "border-top",
    "border-right",
    "border-bottom",
    "border-left",
    "border",
    "border-color",
    "border-style",
    "border-width",
    "background-position",
    "background-repeat",
    "border-spacing",
    "list-style",
    "margin",
    "outline",
    "padding",
    "background",
    "overflow",
    "border-radius"
  ];

  var element = document.createElement('span');

  canSetProperty(propertyName) {
    element.style.setProperty(propertyName, 'initial');
    return element.style.getPropertyValue(propertyName) == 'initial';
  }

  canRemoveProperty(propertyName) {
    element.style.removeProperty(propertyName);
    return element.style.getPropertyValue(propertyName) != 'initial';
  }

  for (var i = 0; i < shorthandProperties.length; ++i) {
    var propertyName = shorthandProperties[i];

    shouldBe(canSetProperty(propertyName), true);
    shouldBe(canRemoveProperty(propertyName), true);
  }
}
