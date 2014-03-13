/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the disabled property on a style element.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  var style1 = new Element.html('''
    <style>
    .test {
      color: red;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style1);

  var style2 = new Element.html('''
    <style id="non-css" type="foo/bar"></style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style2);

  var style3 = new Element.html('''
    <style id="s">
    .test {
      color: green;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style3);

  var styleElement = document.getElementById('s');
  var testElement = document.createElement('div');
  testElement.text = "Test element";
  testElement.className = 'test';
  document.body.append(testElement);

  Expect.isFalse(styleElement.disabled);
  
  Expect.equals("rgb(0, 128, 0)", testElement.getComputedStyle().color);

  styleElement.disabled = true;
  Expect.isTrue(styleElement.disabled);

  Expect.equals("rgb(255, 0, 0)", testElement.getComputedStyle().color);

  // Test reflection in the sheet.
  Expect.isTrue(styleElement.sheet.disabled);

  styleElement.sheet.disabled = false;
  Expect.isFalse(styleElement.sheet.disabled);

  Expect.isFalse(styleElement.disabled);
  Expect.equals("rgb(0, 128, 0)", testElement.getComputedStyle().color);

  // Test disconnected element
  var newStyleElement = document.createElement('style');
  Expect.isFalse(newStyleElement.disabled);

  newStyleElement.disabled = true;
  Expect.isFalse(newStyleElement.disabled);

  // Test non-CSS element
  var otherStyle = document.getElementById('non-css');
  Expect.isFalse(otherStyle.disabled);

  otherStyle.disabled = true;
  Expect.isFalse(otherStyle.disabled);

  testElement.remove();
}

