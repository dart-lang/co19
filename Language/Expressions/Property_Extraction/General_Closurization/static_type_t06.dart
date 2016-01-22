/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The static type of function T.m, if T has an accessible instance member
 *   named m.
 * • The static type of function T.m, if T is Type, e is a constant type
 *   literal and the class corresponding to e declares an accessible static
 *   member or constructor named m.
 * • Function if T is Function and m is call.
 * • The type dynamic otherwise.
 * • The type dynamic otherwise.
 * @description Check that static type of extracted named constructor is
 * dynamic if no constructor named m found
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

class A {
}

class C {
}

main() {
  if (isCheckedMode()) {
    try {
      var o = new C();
      A i = o#m; // Here we expect that static type of o#m is dynamic.
                 // Dynamic can be assigned to A without static warning.
    } on NoSuchMethodError {}
  }
}
