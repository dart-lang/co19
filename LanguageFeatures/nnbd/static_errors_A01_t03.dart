// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call a method, setter, getter or operator on
/// an expression whose type is potentially nullable and not dynamic, except for
/// the methods, setters, getters, and operators on Object.
///
/// @description Check that it is no compile-time error to call a method, setter,
/// getter or operator on an expression whose type is dynamic
/// @author sgrekhov@unipro.ru

class A {
  String m = "";
  void foo() {}
  int get g => 1;
  void set s(int i) {}
  A operator+(A other) => other;
}

main() {
  dynamic x = new A();
  x.m;
  x.foo();
  x.g;
  x.s = 2;
  x + x;
}
