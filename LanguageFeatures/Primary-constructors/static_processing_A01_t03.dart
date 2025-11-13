// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that `new` can be used instead of the class name in
/// declarations of ordinary constructors. Test enums.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

const metadata = 42;

enum E1 {
  a(1);

  final int v;
  @metadata const new(this.v);
}

enum E2 {
  a();

  final int v;
  const new() : v = 2;
}

enum E3 {
  a(1), b();

  final int v;
  const new([int v = 0]) : v = v;
}

enum E4 {
  a(v: 1), b();

  final int v;
  const new({int v = 0}) : v = v;
}

enum E5 {
  a(v: 1);

  final int v;
  const new({required int v}) : v = v;
}

main() {
  Expect.equals(1, E1.a.v);
  Expect.equals(2, E2.a.v);
  Expect.equals(1, E3.a.v);
  Expect.equals(0, E3.b.v);
  Expect.equals(1, E4.a.v);
  Expect.equals(0, E4.b.v);
  Expect.equals(1, E5.a.v);
}
