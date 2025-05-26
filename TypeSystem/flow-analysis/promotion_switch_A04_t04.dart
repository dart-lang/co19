// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet. Informal spec:
/// https://github.com/dart-lang/co19/pull/3169#issuecomment-2885167786
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match adds type of interest to the switch
/// statement/expression variable but doesn't promote the variable after the
/// switch without an assignment.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int _ when (x = 42) > 0:
      x.expectStaticType<Exactly<int>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
  x.expectStaticType<Exactly<Object?>>();
}


test2(Object? x) {
  var y = switch (x) {
    int v when (x = 42) > 0 => x.expectStaticType<Exactly<int>>(),
    _ => x.expectStaticType<Exactly<Object?>>()
  };
  x.expectStaticType<Exactly<Object?>>();
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
}
