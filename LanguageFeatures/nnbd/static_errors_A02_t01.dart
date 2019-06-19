/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 * @description Check that it is a compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable and not
 * dynamic
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

main() {
  String? s = "Lily was";
  int? i = 1;
  double? d = 3.14;

  (s + " here").substring(0); //# 01: compile-time error
  (s + " here").length;       //# 02: compile-time error
  (i + i).isEven;             //# 03: compile-time error
  (d + i).abs();              //# 04: compile-time error
}
