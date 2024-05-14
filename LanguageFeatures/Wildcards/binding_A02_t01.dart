// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test parameters of functions and methods.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

void topLevelFunction1(_, int _, var _) {}
void topLevelFunction2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
void topLevelFunction3<T>(T _, T _, [T? _, T? _]) {}

class C {
  static void staticMethod1(_, int _, var _) {}
  static void staticMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  static void staticMethod3<T>(T _, T _, [T? _, T? _]) {}
  void instanceMethod1(_, int _, var _) {}
  void instanceMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void instanceMethod3<T>(T _, T _, [T? _, T? _]) {}
}

mixin M {
  static void staticMethod1(_, int _, var _) {}
  static void staticMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  static void staticMethod3<T>(T _, T _, [T? _, T? _]) {}
  void instanceMethod1(_, int _, var _) {}
  void instanceMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void instanceMethod3<T>(T _, T _, [T? _, T? _]) {}
}

enum E {
  e1;
  static void staticMethod1(_, int _, var _) {}
  static void staticMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  static void staticMethod3<T>(T _, T _, [T? _, T? _]) {}
  void instanceMethod1(_, int _, var _) {}
  void instanceMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void instanceMethod3<T>(T _, T _, [T? _, T? _]) {}
}

extension type ET(int id) {
  static void staticMethod1(_, int _, var _) {}
  static void staticMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  static void staticMethod3<T>(T _, T _, [T? _, T? _]) {}
  void instanceMethod1(_, int _, var _) {}
  void instanceMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void instanceMethod3<T>(T _, T _, [T? _, T? _]) {}
}

class A {}

extension Ext on A {
  static void staticMethod1(_, int _, var _) {}
  static void staticMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  static void staticMethod3<T>(T _, T _, [T? _, T? _]) {}
  void instanceMethod1(_, int _, var _) {}
  void instanceMethod2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void instanceMethod3<T>(T _, T _, [T? _, T? _]) {}
}

class MA = Object with M;

main() {
  void localFunction1(_, int _, var _) {}
  void localFunction2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  void localFunction3<T>(T _, T _, [T? _, T? _]) {}

  var f1 = (_, int _, var _) {};
  var f2 = (_, int _, var _, [_, int _ = 0, var _ = ""]) {};
  var f3 = <T>(T _, T _, [T? _, T? _]) {};

  topLevelFunction1("1", 2, 3);
  topLevelFunction2("1", 2, 3, "4", 5, "6");
  topLevelFunction3<int>(1, 2, 3, 4);

  localFunction1("1", 2, 3);
  localFunction2("1", 2, 3, "4", 5, "6");
  localFunction3<int>(1, 2, 3, 4);

  f1("1", 2, 3);
  f2("1", 2, 3, "4", 5, "6");
  f3<int>(1, 2, 3, 4);

  C.staticMethod1("1", 2, 3);
  C.staticMethod2("1", 2, 3, "4", 5, "6");
  C.staticMethod3<int>(1, 2, 3, 4);
  C().instanceMethod1("1", 2, 3);
  C().instanceMethod2("1", 2, 3, "4", 5, "6");
  C().instanceMethod3<int>(1, 2, 3, 4);

  M.staticMethod1("1", 2, 3);
  M.staticMethod2("1", 2, 3, "4", 5, "6");
  M.staticMethod3<int>(1, 2, 3, 4);
  MA().instanceMethod1("1", 2, 3);
  MA().instanceMethod2("1", 2, 3, "4", 5, "6");
  MA().instanceMethod3<int>(1, 2, 3, 4);

  E.staticMethod1("1", 2, 3);
  E.staticMethod2("1", 2, 3, "4", 5, "6");
  E.staticMethod3<int>(1, 2, 3, 4);
  E.e1.instanceMethod1("1", 2, 3);
  E.e1.instanceMethod2("1", 2, 3, "4", 5, "6");
  E.e1.instanceMethod3<int>(1, 2, 3, 4);

  ET.staticMethod1("1", 2, 3);
  ET.staticMethod2("1", 2, 3, "4", 5, "6");
  ET.staticMethod3<int>(1, 2, 3, 4);
  ET(1).instanceMethod1("1", 2, 3);
  ET(1).instanceMethod2("1", 2, 3, "4", 5, "6");
  ET(1).instanceMethod3<int>(1, 2, 3, 4);

  Ext.staticMethod1("1", 2, 3);
  Ext.staticMethod2("1", 2, 3, "4", 5, "6");
  Ext.staticMethod3<int>(1, 2, 3, 4);
  A().instanceMethod1("1", 2, 3);
  A().instanceMethod2("1", 2, 3, "4", 5, "6");
  A().instanceMethod3<int>(1, 2, 3, 4);
}
