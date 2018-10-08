/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that setting the value of input type=file throws and
 * changing type resets.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement("input");
  document.body.append(input);

  input.value = "example.txt";
  shouldBeEqualToString(input.value, "example.txt");
  input.type = "file";
  shouldBeEqualToString(input.value, "");
  shouldThrow(() => input.value = "foo",
      (e) => e is DomException && e.name == DomException.INVALID_STATE);
  input.value = "";
}
