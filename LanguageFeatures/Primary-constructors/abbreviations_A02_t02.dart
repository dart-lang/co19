// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a named factory constructor can be declared using
/// the keyword `factory`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  C() {
    flag = 'called';
  }
  factory name() => C();
}

enum E {
  e0;
  const E();
  factory name() => E.e0;
}

extension type ET(int v) {
  factory name() => ET(42);
}

main() {
  Expect.equals('called', C.name().flag);
  Expect.equals(E.e0, E.name());
  Expect.equals(42, ET.name().v);
}
