// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet. Informal spec:
/// https://github.com/dart-lang/co19/pull/3169#issuecomment-2885167786
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match adds type of interest to the switch
/// statement/expression variable.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int _:
      print("");
    case _:
      x = 42;
      x.expectStaticType<Exactly<int>>();
  }
}

test2(Object? x) {
  var y = switch (x) {
    int v => 42,
    _ when (x = 42) > 0 => x.expectStaticType<Exactly<int>>(),
    _ => 0
  };
}

test3(Object? x) {
  switch (x) {
    case num v:
      x.expectStaticType<Exactly<num>>();
    case int _: // ignore: unreachable_switch_case
      x = 3.14;
      x.expectStaticType<Exactly<num>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
  x.expectStaticType<Exactly<Object?>>();
}


test4(Object? x) {
  var y = switch (x) {
    num _ => x.expectStaticType<Exactly<num>>(),
    int v when (x = 3.14) > 0 => x.expectStaticType<Exactly<num>>(), // ignore: unreachable_switch_case
    _ => x.expectStaticType<Exactly<Object?>>()
  };
  x.expectStaticType<Exactly<Object?>>();
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
  test3(1);
  test3(null);
  test4(1);
  test4(null);
}
