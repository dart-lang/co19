/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for value sanitization algorithm.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var input;

  var fallbackValue = "#000000";

  input = document.createElement('input');
  input.type = 'color';
  shouldBe(input.value, fallbackValue);

  // Valid values
  input.value = ""; shouldBe(input.value, fallbackValue);
  input.value = "#000000"; shouldBe(input.value, "#000000");
  input.value = "#123456"; shouldBe(input.value, "#123456");
  input.value = "#789abc"; shouldBe(input.value, "#789abc");
  input.value = "#defABC"; shouldBe(input.value, "#defabc");
  input.value = "#DEF012"; shouldBe(input.value, "#def012");

  // Invalid values: named colors
  input.value = "black"; shouldBe(input.value, fallbackValue);
  input.value = "blue"; shouldBe(input.value, fallbackValue);
  input.value = "red"; shouldBe(input.value, fallbackValue);
  input.value = "purple"; shouldBe(input.value, fallbackValue);
  input.value = "green"; shouldBe(input.value, fallbackValue);
  input.value = "cyan"; shouldBe(input.value, fallbackValue);
  input.value = "yellow"; shouldBe(input.value, fallbackValue);
  input.value = "white"; shouldBe(input.value, fallbackValue);
  input.value = "White"; shouldBe(input.value, fallbackValue);
  input.value = "WHITE"; shouldBe(input.value, fallbackValue);

  // Invalid values
  input.value = "000000"; shouldBe(input.value, fallbackValue);
  input.value = "#FFF"; shouldBe(input.value, fallbackValue);
  input.value = " #ffffff"; shouldBe(input.value, fallbackValue);
  input.value = "#ffffff "; shouldBe(input.value, fallbackValue);
  input.value = "#00112233"; shouldBe(input.value, fallbackValue);
  input.value = "rgb(0,0,0)"; shouldBe(input.value, fallbackValue);
  input.value = "xxx-non-existent-color-name"; shouldBe(input.value, fallbackValue);
  input.value = "transparent"; shouldBe(input.value, fallbackValue);
}
