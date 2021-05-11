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
///    external static var i1;
/// desugared as
///  class A {
///    external static dynamic get i1;
///    external static void set i1(dynamic _);
/// @author sgrekhov@unipro.ru

class A {
  external static var i;

  static test() {
    int j = i;
    String s = i;
    i = 42;
    i = "Lily was here";
  }
}

main() {
  new A();
}
