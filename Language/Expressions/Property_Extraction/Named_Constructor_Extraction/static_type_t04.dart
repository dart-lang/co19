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
 * accessible constructor named m in the class
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
class A {
  A.m();
}

class C extends A {
  C() : super.m();
}

main() {
  try {
    var i = new C#m;
    i.something; // i is dynamic, so no static warning here
  } on NoSuchMethodError {}
}
