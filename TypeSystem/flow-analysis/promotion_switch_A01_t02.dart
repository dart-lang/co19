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
/// @issue 60496

import 'dart:async';
import '../../Utils/static_type_helper.dart';

test1(FutureOr<int>? x) {
  switch (x) {
    case null: // no promotion to `Null`
      x.expectStaticType<Exactly<FutureOr<int>?>>();
    case int _:  // promoted to `int`
      x.expectStaticType<Exactly<int>>();
    case var v: // promoted to `Future<int>`, `Null` and `int` cases are cached above
      x.expectStaticType<Exactly<Future<int>>>();
  }
}

test2(FutureOr<int>? x) {
  var y = switch (x) {
    null => x.expectStaticType<Exactly<FutureOr<int>?>>(),
    int _ => x.expectStaticType<Exactly<int>>(),
    var v => x.expectStaticType<Exactly<Future<int>>>()
  };
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
}
