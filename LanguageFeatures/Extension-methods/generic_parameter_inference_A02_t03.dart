/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The extension type parameter can also occur as a parameter type
 * for the method.
 *
 *   Example:
 *
 *   extension TypedEquals<T> {
 *     bool equals(T value) => this == value;
 *   }
 *
 * Using such an extension as:
 *
 *   Object o = ...;
 *   String s = ...;
 *   print(s.equals(o));  // Compile-time type error.
 *
 * will fail. While we could make it work by inferring [T] as [Object], we
 * don't. We infer [T] only based on the receiver type, and therefore [T] is
 * [String], and [o] is not a valid argument (at least not when we remove
 * implicit downcasts).
 * @description Check that runtime error is thrown when method type parameter is
 * Object and there is implicit downcast.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

Object getObject() => new Object();
String getString() => "OK";

extension TypedEquals<T> on T {
  bool equals(T value) => this == value;
}

main() {
  String s = getString();
  Object o = getObject();

  Expect.throws(() { s.equals(o); });
}
