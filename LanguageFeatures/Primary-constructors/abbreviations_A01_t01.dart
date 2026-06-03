// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that the class name can be replaced with the keyword
/// `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  new() {
    flag = 'called';
  }
}

mixin class M {
  new();
}

extension type ET.n(int v) {
  new(this.v);
}

main() {
  Expect.equals('called', C().flag);
  M();
  Expect.equals(42, ET(42).v);
}
