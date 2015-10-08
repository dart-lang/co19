/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the type of the constructor function,
 * if T denotes a class in the surrounding scope with an accessible constructor
 * f named m. Otherwise the static type of i is dynamic
 * @description Check that the static type of i is dynamic if there are no
 * constructor named m in the class
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
      A i = new C#m; // Here we expect that static type of new C#m is dynamic.
                     // Dynamic can be assigned to A without static warning.
    } on NoSuchMethodError {}
  }
}
