// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that the class name and the period can be replaced by the
/// keyword `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  new name() {
    flag = 'called';
  }
}

mixin class M {
  new name();
}

extension type ET(int v) {
  new name(this.v);
}

main() {
  Expect.equals('called', C.name().flag);
  M.name();
  Expect.equals(42, ET.name(42).v);
}
