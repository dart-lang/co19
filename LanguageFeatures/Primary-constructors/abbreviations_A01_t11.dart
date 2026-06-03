// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that a constructor can be declared using the keyword
/// `new`. Test a redirecting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C {
  String flag = '';
  C.other() {
    flag = 'called';
  }
  new() : this.other();
}

extension type ET.other(int v) {
  new() : this.other(42);
}

main() {
  Expect.equals('called', C().flag);
  Expect.equals(42, ET().v);
}
