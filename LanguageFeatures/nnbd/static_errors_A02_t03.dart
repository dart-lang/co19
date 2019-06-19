/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 * @description Check that it is no compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable but they
 * are methods and fields on Object
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

main() {
  String? s = "Lily was";
  int? i = 1;
  double? d = 3.14;

  (s + " here").hashCode;
  (s + " here").runtimeType;
  (s + " here").toString();
  (i + i).hashCode;
  (i + i).runtimeType;
  (d + i).toString();
}
