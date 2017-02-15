/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object decode(String str, {reviver(key, value)})
 * Throws FormatException if the input is not valid JSON text.
 * @note undocumented
 * @description Checks that this method works for non-ASCII values
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  JsonCodec codec = new JsonCodec();

  Expect.mapEquals({"a": "кириллица"}, codec.decode('{"a": "кириллица"}'));
  Expect.mapEquals({"й": "ф"}, codec.decode('{"й": "ф"}'));
  Expect.listEquals(["a", "кириллица"], codec.decode('["a", "кириллица"]'));
  Expect.listEquals(["й", "ф"], codec.decode('["й", "ф"]'));
}
