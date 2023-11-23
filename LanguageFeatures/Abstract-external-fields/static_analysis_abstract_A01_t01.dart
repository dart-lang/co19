// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An abstract instance variable declaration D is treated as an
/// abstract getter declaration and possibly an abstract setter declaration. The
/// setter is included if and only if D is non-final. The return type of the
/// getter and the parameter type of the setter, if present, is the type of D
/// (which may be declared explicitly, obtained by override inference, or
/// defaulted to dynamic). The parameter of the setter, if present, has the
/// modifier covariant if and only if D has the modifier covariant
///
/// @description Checks that declaration
///  abstract int i1, i2;
/// desugared as
///  int get i1;
///  void set i1(int _);
///  int get i2;
///  void set i2(int _);
/// @author sgrekhov@unipro.ru


abstract class A {
  abstract int i1, i2;
}

test(A a) {
  a.i1;
  a.i1 = 42;
  a.i2;
  a.i2 = 1;
}

main() {
}
