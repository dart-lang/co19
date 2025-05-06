// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet.
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match in switch statement and expression
/// promotes the variable.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int _: // promoted to `int`
      x.expectStaticType<Exactly<int>>();
    case null: // no promotion to `Null`
      x.expectStaticType<Exactly<Object?>>();
    case _: // promoted to `Object`, `Null` case cached above
      x.expectStaticType<Exactly<Object>>();
  }
}

test2(Object? x) {
  var v = switch (x) {
    int _ => x.expectStaticType<Exactly<int>>(),
    null => x.expectStaticType<Exactly<Object?>>(),
    _ => x.expectStaticType<Exactly<Object>>()
  };
}

main() {
  test1(1);
  test1("one");
  test1(null);
  test2(1);
  test2("one");
  test2(null);
}
