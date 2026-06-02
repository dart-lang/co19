// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that the class name and the period can be replaced by the
/// keyword `new`. Test `const new` case.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  final flag;
  const new name() : flag = 'called';
}

mixin class M {
  const new name();
}

enum E {
  e0.name();

  final flag;
  const new name() : flag = 'called';
}

extension type ET(int v) {
  const new name(this.v);
}

main() {
  Expect.equals('called', const C.name().flag);
  const M.name();
  Expect.equals('called', E.e0.flag);
  Expect.equals(42, const ET.name(42).v);
}
