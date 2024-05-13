// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test parameters of constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C<T> {
  C.constructor1(_, int _, var _) {}
  C.constructor2(_, int _, var _, [_, int _ = 0, var _ = ""]) {}
  C.constructor3(T _, T _, [T? _, T? _]) {}

  const C.constConstructor1(_, int _, var _);
  const C.constConstructor2(_, int _, var _, [_, int _ = 0, var _ = ""]);
  const C.constConstructor3(T _, T _, [T? _, T? _]);

  factory C.factoryConstructor1(_, int _, var _) = C.constructor1;
  factory C.factoryConstructor2(_, int _, var _, [_, int _, var _])
      = C.constructor2;
  factory C.factoryConstructor3(T _, T _, [T? _, T? _]) = C.constructor3;

  C.redirectingConstructor1(_, int _, var _) : this.constConstructor1(1, 2, 3);
  C.redirectingConstructor2(_, int _, var _, [_, int _ = 0, var _ = ""])
      : this.constConstructor1(1, 2, 3);
  C.redirectingConstructor3(T _, T _, [T? _, T? _])
      : this.constructor1(1, 2, 3);
}

enum E<T> {
  e1.constructor1("1", 2, "3"),
  e2.constructor2("4", 5, "6", 7, 8, "9"),
  e3<int>.constructor3(1, 2, null, 4),
  e4.redirectingConstructor1(1, 2, 3),
  e5.redirectingConstructor2(1, 2, 3, 4, 5),
  e6<int>.redirectingConstructor3(1, 2, 3);

  const E.constructor1(_, int _, var _);
  const E.constructor2(_, int _, var _, [_, int _ = 0, var _ = ""]);
  const E.constructor3(T _, T _, [T? _, T? _]);

  const E.redirectingConstructor1(_, int _, var _) : this.constructor1(1, 2, 3);
  const E.redirectingConstructor2(_, int _, var _, [_, int _ = 0, var _ = ""])
      : this.constructor1(1, 2, 3);
  const E.redirectingConstructor3(T _, T _, [T? _, T? _])
      : this.constructor1(1, 2, 3);
}

extension type ET<T>(int id) {
  ET.constructor1(this.id, int _, var _) {}
  ET.constructor2(this.id, int _, var _, [_, int _ = 0, var _ = ""]) {}
  ET.constructor3(this.id, T _, [T? _, T? _]) {}

  const ET.constConstructor1(this.id, int _, var _);
  const ET.constConstructor2(this.id, int _, var _, [_, int _ = 0, var _ = ""]);
  const ET.constConstructor3(this.id, T _, [T? _, T? _]);

  factory ET.factoryConstructor1(int _, int _, var _) = ET.constructor1;
  factory ET.factoryConstructor2(
      int _, int _, var _, [_, int _, var _]) = ET.constructor2;
  factory ET.factoryConstructor3(int _, T _, [T? _, T? _]) = ET.constructor3;

  ET.redirectingConstructor1(_, int _, var _) : this.constConstructor1(1, 2, 3);
  ET.redirectingConstructor2(_, int _, var _, [_, int _ = 0, var _ = ""])
      : this.constConstructor1(1, 2, 3);
  ET.redirectingConstructor3(T _, T _, [T? _, T? _])
      : this.constructor1(1, 2, 3);
}

main() {
  C.constructor1("1", 2, true);
  C.constructor2("1", 2, true, "3", 4, false);
  C<int>.constructor3(1, 2, 3, 4);
  const C.constConstructor1("1", 2, true);
  const C.constConstructor2("1", 2, true, "3", 4, "5");
  const C<int>.constConstructor3(1, 2, null, 4);
  C.factoryConstructor1("1", 2, true);
  C.factoryConstructor2("1", 2, true, "3", 4, "5");
  C<int>.factoryConstructor3(1, 2, 3, 4);
  C.redirectingConstructor1("1", 2, true);
  C.redirectingConstructor2("1", 2, true, "3", 4, "5");
  C<int>.redirectingConstructor3(1, 2, 3, 4);

  print(E);

  ET.constructor1(1, 2, "3");
  ET.constructor2(1, 2, true, "3", 4, "5");
  ET<int>.constructor3(1, 2, 3, 4);
  const ET.constConstructor1(1, 2, true);
  const ET.constConstructor2(1, 2, true, "3", 4, "5");
  const ET<int>.constConstructor3(1, 2, null, 4);
  ET.factoryConstructor1(1, 2, true);
  ET.factoryConstructor2(1, 2, true, "3", 4, "5");
  ET<String>.factoryConstructor3(1, "2", null, "4");
  ET.redirectingConstructor1("1", 2, true);
  ET.redirectingConstructor2("1", 2, true, "3", 4, "5");
  ET<int>.redirectingConstructor3(1, 2, 3, 4);
}
