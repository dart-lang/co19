// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` rather than the class name in
/// declarations of ordinary (non-declaring) constructors is purely syntactic.
/// The static analysis and meaning of such constructors is identical to the
/// form that uses the class name.
///
/// @description Check that `new` can be used instead of the class name in
/// declarations of ordinary constructors. Test classes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1 {
  int? v;
  new() {
  v = 1;
}
}

class C2 {
  final int v;
  const new(int v) : v = v;
}

class C3 {
  final int v;
  new(this.v);
}

class A {
  int v;
  A(this.v);
}

class C4 extends A {
  new(super.v);
}

class C5 {
  final int v;
  new([int v = 0]) : v = v;
}

class C6 {
  final int v;
  const new({int v = 0}) : v = v;
}

class C7 {
  final int v;
  new({required int v}) : v = v;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(2, C2(2).v);
  Expect.equals(3, C3(3).v);
  Expect.equals(4, C4(4).v);
  Expect.equals(0, C5().v);
  Expect.equals(5, C5(5).v);
  Expect.equals(0, C6().v);
  Expect.equals(6, C6(v: 6).v);
  Expect.equals(7, C7(v: 7).v);
}
