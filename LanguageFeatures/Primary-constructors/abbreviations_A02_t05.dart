// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a constant factory constructor can be declared using
/// the `const factory` syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  final String flag;
  const C.other() : flag = 'called';
  const factory() = C.other;
}

extension type const ET.other(int v) {
  const factory(int v) = ET.other;
}

main() {
  Expect.equals('called', const C().flag);
  Expect.equals(42, const ET(42).v);
}
