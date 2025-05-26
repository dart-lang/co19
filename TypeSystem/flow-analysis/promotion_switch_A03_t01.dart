// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet. Informal spec:
/// https://github.com/dart-lang/co19/pull/3169#issuecomment-2885167786
/// TODO (sgrekhov): update when specified
///
/// @description Checks promotion in the switch expression/statement in the case
/// when the variable is assigned in the `when` part.
/// @author sgrekhov22@gmail.com
/// @issue 60674

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int v when (x = 42) == 42:
      x.expectStaticType<Exactly<int>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test2(Object? x) {
  switch (x) {
    case null when (x = null) == null:
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object>>();
  }
}

test3(Object? x) {
  switch (x) {
    case _ when (x = 42) == 42:
      x.expectStaticType<Exactly<Object>>();
  }
}

test4(Object? x) {
  var v = switch (x) {
    int _ when (x = 42) == 42 =>
      x.expectStaticType<Exactly<int>>(),
    _ => x.expectStaticType<Exactly<Object?>>(),
  };
}

test5(Object? x) {
  var v = switch (x) {
    null when (x = null) == null =>
      x.expectStaticType<Exactly<Object?>>(),
    _ => x.expectStaticType<Exactly<Object>>(),
  };
}

test6(Object? x) {
  var v = switch (x) {
    _ when (x = 42) == 42 => x.expectStaticType<Exactly<Object>>(),
    _ => x.expectStaticType<Exactly<Object>>(),
  };
}

main() {
  test1(1);
  test1("one");
  test1(null);
  test2(1);
  test2("one");
  test2(null);
  test3(1);
  test3("one");
  test3(null);
  test4(1);
  test4("one");
  test4(null);
  test5(1);
  test5("one");
  test5(null);
  test6(1);
  test6("one");
  test6(null);

  test22("");
}
