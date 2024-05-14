// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test local variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

test1() {
  var _ = 1;
  String _ = "2";
}

test2() {
  var _, _;
  var _ = 1, _ = "x";
}

test3() {
  final _ = 1, _ = 2;
}

test4() {
  int? _, _ = 1, _;
}

test5() {
  const _ = 1;
  const _ = 2, _ = 3;
}

main() {
  test1();
  test2();
  test3();
  test4();
  test5();
}
