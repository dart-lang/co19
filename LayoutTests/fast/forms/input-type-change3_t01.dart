/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for writing and reading .type property of
 * HTMLInputElement.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');

  // The default type is "text".
  shouldBe(input.type, "text");
  shouldBeNull(input.getAttribute('type'));

  check(value, expected, [expectedAttributeValue]) {
    debug('check($value, $expected, $expectedAttributeValue)');
    input.type = value;
    shouldBe(input.type, expected);

    if (expectedAttributeValue == null)
      expectedAttributeValue = expected;

    shouldBe(input.getAttribute('type'), expectedAttributeValue);
  }

  check("text", "text");
  check("TEXT", "text", "TEXT");  // input.type must return a lower case value according to DOM Level 2.
  check(" text ", "text", " text ");
  check("button", "button");
  check(" button ", "text", " button ");
  check("checkbox", "checkbox");
  check("email", "email");
  check("file", "file");
  check("hidden", "hidden");
  check("image", "image");
  check("isindex", "text", "isindex");
  check("number", "number");
  check("password", "password");
  check("passwd", "text", "passwd");
  check("radio", "radio");
  check("range", "range");
  check("reset", "reset");
  check("search", "search");
  check("submit", "submit");
  check("tel", "tel");
  check("telephone", "text", "telephone");
  check("url", "url");
  check("uri", "text", "uri");

  // Empty and unknown value handling.
  check("", "text", "");
  check("x-unknown", "text", "x-unknown");
  input.attributes.remove('type');
  shouldBeNull(input.getAttribute('type'));
}
