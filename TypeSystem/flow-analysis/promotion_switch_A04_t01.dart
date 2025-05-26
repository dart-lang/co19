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
  }
  x = 42;
  x.expectStaticType<Exactly<int>>();
}

test2(Object? x) {
  if (1 > 2) {
    switch (x) {
      case int v:
    }
  }
  x = 42;
  x.expectStaticType<Exactly<int>>();
}

test3(Object? x) {
  var y = switch (x) {
    int v => 42,
    _ => 0
  };
  x = 42;
  x.expectStaticType<Exactly<int>>();
}

test4(Object? x) {
  if (1 > 2) {
    var y = switch (x) {
      int v => 42,
      _ => 0
    };
  }
  x = 42;
  x.expectStaticType<Exactly<int>>();
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
