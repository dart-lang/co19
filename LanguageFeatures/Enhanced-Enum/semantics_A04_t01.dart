// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If no toString member was declared, add
/// String toString() => “Name.${_$name}”;.
///
/// @description Check that if no toString member was declared, then
/// String toString() => “Name.${_$name}”; is added.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

import "../../Utils/expect.dart";

enum E<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  final T _t;

  const E(this._t);
}

main() {
  Expect.equals("E.e1", E.e1.toString());
  Expect.equals("E.e2", E.e2.toString());
  Expect.equals("E.e3", E.e3.toString());
}
