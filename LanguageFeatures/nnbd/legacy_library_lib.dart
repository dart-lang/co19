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

class A implements AMx {
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

class Mx {
  int iMx = 42;
}

class AMx {
  String text = "No woman, no cry";
}

mixin Mxn on AMx {
  String sMxn = "Show must go on";
}

abstract class I {}

class Const {
  const Const();
}

int iLegacy = 42;
String sLegacy = "Yesterday, All my troubles seemed so far away";
A aLegacy = new A();

class S {}

S getLegacyS() => null;

dynamic getLegscyDynamic(x) => x;

Null getLegscyNull() => null;
