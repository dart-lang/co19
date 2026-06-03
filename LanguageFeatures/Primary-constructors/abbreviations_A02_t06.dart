// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a named constant factory constructor can be declared
/// using the `const factory name` syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  final String flag;
  const C() : flag = 'called';
  const factory name() = C.new;
}

extension type const ET(int v) {
  const factory name(int v) = ET.new;
}

main() {
  Expect.equals('called', const C.name().flag);
  Expect.equals(42, const ET.name(42).v);
}
