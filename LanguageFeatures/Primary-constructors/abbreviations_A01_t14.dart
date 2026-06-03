// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a constant named constructor `name` can be declared
/// using the `const new name` syntax. Test a redirecting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  final flag;
  const C() : flag = 'called';
  const new name() : this();
}

enum E {
  e0.name();

  final flag;
  const E() : flag = 'called';
  const new name() : this();
}

extension type const ET(int v) {
  const new name() : this(42);
}

main() {
  Expect.equals('called', const C.name().flag);
  Expect.equals('called', E.e0.flag);
  Expect.equals(42, const ET.name().v);
}
