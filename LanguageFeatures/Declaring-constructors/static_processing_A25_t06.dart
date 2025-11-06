// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` rather than the class name in
/// declarations of ordinary (non-declaring) constructors is purely syntactic.
/// The static analysis and meaning of such constructors is identical to the
/// form that uses the class name.
///
/// @description Check that `factory` can be used instead of the class name in
/// declarations of ordinary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1 {
  int v;
  C1.create(this.v);

  factory() => C1.create(1);
}

class C2 {
  final int v;
  const C2.create(this.v);

  const factory(int v) = C2.create;
}

extension type ET1.create(int v) {
  factory() => ET1.create(1);
}

extension type const ET2.create(int v) {
  const factory ET2 (int v) = ET2.create;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(2, C2(2).v);
  Expect.equals(1, ET1().v);
  Expect.equals(2, ET2(2).v);
}
