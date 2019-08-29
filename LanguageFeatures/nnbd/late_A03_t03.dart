/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A read of a field or variable which is marked as late which has
 * not yet been written to causes the initializer expression of the variable to
 * be evaluated to a value, assigned to the variable or field, and returned as
 * the value of the read.
 * ...
 * Evaluating the initializer expression may validly cause a write to the field
 * or variable, assuming that the field or variable is not final. In this case,
 * the variable assumes the written value. The final value of the initializer
 * expression overwrites any intermediate written values.
 *
 * @description Check that it is a compile error if initializing expression
 * writes an intermediate value to final field or variable
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class C {
  static String initS(String val1, String val2) {
    s = val1;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    return val2;
  }
  static late final String s = initS("No woman", "no cry");

  late final String v = initV("No woman", "no cry");

  initV(String val1, String val2) {
    v = val1;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    return val2;
  }
}

late final String g = initG("No woman", "no cry");

initG(String val1, String val2) {
  g = val1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  return val2;
}

main() {
  late final String l = initL("No woman", "no cry");

  initL(String val1, String val2) {
    l = val1;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    return val2;
  }
}
