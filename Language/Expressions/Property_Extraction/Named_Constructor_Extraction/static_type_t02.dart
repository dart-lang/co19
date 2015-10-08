/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the type of the constructor function,
 * if T denotes a class in the surrounding scope with an accessible constructor
 * f named m. Otherwise the static type of i is dynamic
 * @description Check that it is static warning if the extracted named
 * constructor is assigned to wrong type variable
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

class A {
}

class C {
  C.m();
}

main() {
  checkTypeError(() {
    try {
      A i = new C#m;  /// static type warning
    } on NoSuchMethodError {}
  });
}
