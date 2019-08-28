/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// @dart=2.4
// SharedOptions=--enable-experiment=non-nullable
library legacy_library_lib;

class A {
  void foo() {}
  String test() => "Lily was here";
  String text = "Let it be";
  int operator[](int index) => index;
  void operator[]=(int index, var value) => value;
}

class C<X extends A> {
  X x;
  C(this.x);
}

class M {
}

abstract class I {}

class Const {
  const Const();
}