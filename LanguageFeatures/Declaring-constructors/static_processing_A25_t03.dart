// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` rather than the class name in
/// declarations of ordinary (non-declaring) constructors is purely syntactic.
/// The static analysis and meaning of such constructors is identical to the
/// form that uses the class name.
///
/// @description Check that `new` can be used instead of the class name in
/// declarations of ordinary constructors. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

enum E1 {
  a(1), b.someName(2);

  final int v;
  const new(this.v);
  const new.someName(this.v);
}

enum E2 {
  a(), b.someName();

  final int v;
  const new() : v = 2;
  const new.someName() : v = -2;
}

enum E3 {
  a(1), b(), c.someName(2), d.someName();

  final int v;
  const new([int v = 0]) : v = v;
  const new.someName([int v = 0]) : v = v;
}

enum E4 {
  a(v: 1), b(), c.someName(v: 2), d.someName();

  final int v;
  const new({int v = 0}) : v = v;
  const new.someName({int v = 0}) : v = v;
}

enum E5 {
  a(v: 1), c.someName(v: 2);

  final int v;
  const new({required int v}) : v = v;
  const new.someName({required int v}) : v = v;
}

main() {
  Expect.equals(1, E1.a.v);
  Expect.equals(2, E1.b.v);
  Expect.equals(2, E2.a.v);
  Expect.equals(-2, E2.b.v);
  Expect.equals(1, E3.a.v);
  Expect.equals(0, E3.b.v);
  Expect.equals(2, E3.c.v);
  Expect.equals(0, E3.d.v);
  Expect.equals(1, E4.a.v);
  Expect.equals(0, E4.b.v);
  Expect.equals(2, E4.c.v);
  Expect.equals(0, E4.d.v);
  Expect.equals(1, E5.a.v);
  Expect.equals(2, E4.b.v);
}
