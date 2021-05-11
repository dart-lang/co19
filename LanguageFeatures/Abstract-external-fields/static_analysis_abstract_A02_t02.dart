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
///  abstract var x;
/// desugared as
///  dynamic get x;
///  void set x(dynamic _);
/// @author sgrekhov@unipro.ru


abstract class A {
  abstract var x;
}

class C1 extends A { // missing getter
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  void set x(var _) {}
}

class C2 extends A { // missing setter
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  int get x => 42;
}

main() {
}
