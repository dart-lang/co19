// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test parameters of typedefs.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

typedef int F1(_, int _);
typedef int F2(_, int _, [_, int _]);
typedef int F3<T>(T _, T _, [T? _, T? _]);

typedef F4 = int Function(dynamic _, int _);
typedef F5 = int Function(dynamic _, int _, [dynamic _, int _]);
typedef F6<T> = int Function(T _, T _, [T? _, T? _]);

main() {
  // Let's check that type aliases above work as intended
  F1 f1 = (_, int _) => 1;
  F2 f2 = (var _, int _, [var _, int _ = 0]) => 2;
  F3<int> f3 = (int _, int _, [int? _, int? _]) => 3;
  F4 f4 = (_, int _) => 4;
  F5 f5 = (var _, int _, [var _, int _ = 0]) => 5;
  F6<int> f6 = (int _, int _, [int? _, int? _]) => 6;

  Expect.equals(1, f1(1, 2));
  Expect.equals(2, f2(1, 2, 3, 4));
  Expect.equals(3, f3(1, 2, null, 4));
  Expect.equals(4, f4(1, 2));
  Expect.equals(5, f5(1, 2, 3, 4));
  Expect.equals(6, f6(1, 2, null, 4));
}
