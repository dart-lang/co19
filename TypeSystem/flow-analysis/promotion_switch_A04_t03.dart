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
      x = 3.14;
      x.expectStaticType<Exactly<Object>>(); // `num` is not a type of interest yet
    case num _:
      x.expectStaticType<Exactly<num>>();
    case _:
      x = 3.14;
      x.expectStaticType<Exactly<num>>(); // Now ok
  }
}

test2(Object? x) {
  var y =   switch (x) {
    int _ => [x = 3.14, x.expectStaticType<Exactly<Object>>()],
    num _ => [x.expectStaticType<Exactly<num>>()],
    _ => [x = 3.14, x.expectStaticType<Exactly<num>>()]
  };
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
}
