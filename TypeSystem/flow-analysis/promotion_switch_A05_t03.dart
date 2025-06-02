// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet. Informal spec:
/// https://github.com/dart-lang/co19/pull/3169#issuecomment-2885167786
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match promotes the variable when a case
/// scope is shared but cases have the same type.
/// @author sgrekhov22@gmail.com
/// @issue 60708

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int v when (x = 42) > 0:
    case int v:
      // See https://github.com/dart-lang/sdk/issues/60708#issuecomment-2887677566
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test2(Object? x) {
  switch (x) {
    case int _ when (x = 42) > 0:
    case int v:
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test3(Object? x) {
  switch (x) {
    case int _ when (x = 42) > 0:
    case int _:
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
  test3(1);
  test3(null);
}
