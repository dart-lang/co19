// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a named constructor `name` can be declared using the
/// `new name` syntax. Test a redirecting constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  C() {
    flag = 'called';
  }
  new name() : this();
}

extension type ET(int v) {
  new name() : this(42);
}

main() {
  Expect.equals('called', C.name().flag);
  Expect.equals(42, ET.name().v);
}
