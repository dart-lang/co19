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
///   abstract covariant var cx;
/// desugared as
///   dynamic get cx;
///   void set cx(covariant dynamic _);
/// @author sgrekhov@unipro.ru


abstract class A {
  abstract covariant var cn;
}

class C1 extends A {
  dynamic get cn => 3.14;
  void set cn(covariant dynamic _) {}
}

class C2 extends C1 {
  int get cn => 42;
  @override
  void set cn(int _) {}
}
test(A a, C1 c1, C2 c2) {
  a.cn;
  a.cn = 42;
  a.cn = 3.14;

  c1.cn;
  c1.cn = 42;
  c1.cn = 3.14;

  c2.cn;
  c2.cn = 42;
}

main() {
}
