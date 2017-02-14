/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object convert(String input)
 * Converts the given JSON-string input to its corresponding object.
 * @description Checks that this method works for non-ASCII values
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  JsonDecoder decoder = new JsonDecoder();

  Expect.mapEquals({"a": "кириллица"}, decoder.convert('{"a": "кириллица"}'));
  Expect.mapEquals({"й": "ф"}, decoder.convert('{"й": "ф"}'));
  Expect.listEquals(["a", "кириллица"], decoder.convert('["a", "кириллица"]'));
  Expect.listEquals(["й", "ф"], decoder.convert('["й", "ф"]'));
}
