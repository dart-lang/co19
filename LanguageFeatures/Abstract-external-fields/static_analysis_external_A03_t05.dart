// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external variable declaration D is treated as an external
/// getter declaration and possibly an external setter declaration. The setter is
/// included if and only if D is non-final. The return type of the getter and the
/// parameter type of the setter, if present, is the type of D (which may be
/// declared explicitly, obtained by override inference, or defaulted to dynamic).
/// The parameter of the setter, if present, has the modifier covariant if and
/// only if D has the modifier covariant (the grammar only allows this modifier
/// on external instance variables).
///
/// @description Checks that declaration
///  class A {
///    external final int i1;
///    external final i2;
/// desugared as
///  class A {
///    external int get i1;
///    external dynamic get i2;
/// @author sgrekhov@unipro.ru

class A {
  external final int i1;
  external final i2;

  test() {
    i1 = 42;
//  ^^
// [analyzer] unspecified
// [cfe] unspecified

    i2 = "Lily was here";
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new A();
}
