// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a factory constructor can be declared using the
/// keyword `factory`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  C.other() {
    flag = 'called';
  }
  factory() => C.other();
}

enum E {
  e0.other();
  const E.other();
  factory() => E.e0;
}

extension type ET.other(int v) {
  factory() => ET.other(42);
}

main() {
  Expect.equals('called', C().flag);
  Expect.equals(E.e0, E());
  Expect.equals(42, ET().v);
}
