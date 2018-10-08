/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check stepMismatch results for unsupported types.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input');
  document.body.append(input);

  debug('Unsupported types');
  input.type = "text"; input.step = "3"; input.min = ""; input.value = "2";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "button";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "checkbox";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "color";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "email";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "hidden"; 
  shouldBe(input.validity.stepMismatch, false);
  input.type = "image";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "khtml_isindex";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "passwd";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "radio";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "reset";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "search";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "submit";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "tel";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "url";
  shouldBe(input.validity.stepMismatch, false);
  input.type = "file";
  shouldBe(input.validity.stepMismatch, false);
}
