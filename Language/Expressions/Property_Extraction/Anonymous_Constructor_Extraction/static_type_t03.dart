/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is the type of the constructor function T(),
 * if T denotes a class in the surrounding scope with an anonymous constructor
 * T(). Otherwise the static type of i is dynamic.
 * @description Check that if class has no anonymous constructor then static
 * type of the extracted constructor is dynamic
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

class A {
}

class C {
  C.m();
}

main() {
  if (isCheckedMode()) {
    try {
      A i = new C#; // Here we expect that static type of new C# is dynamic.
                    // Dynamic can be assigned to A without static warning.
    } on NoSuchMethodError {}
  }
}
