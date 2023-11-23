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
///   abstract covariant var cn;
/// desugared as
///   dynamic get cn;
///   void set cn(covariant dynamic _);
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

abstract class A {
  abstract covariant var cn;
}

class C1 extends A {
  dynamic get cn => 3.14;
  void set cn(dynamic _) {}
}

class C2 extends C1 {
  // Without covariant keyword in class A overrides below are not valid
  int get cn => 42;
  void set cn(int _) {}
}

main() {
  C2 c2 = new C2();
  Expect.equals(42, c2.cn);
}
