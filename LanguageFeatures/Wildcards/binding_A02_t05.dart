// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test local variables and functions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

test1() {
  var _ = 1;
  void _() {}
}

test2() {
  var _, _;
  int _(int _) => 42;
}

test3() {
  void _() {}
  int _(int _) => 42;
  String _(int _) => "42";
}

test4() {
  final _ = 1;
  int _(int v) => 42;
  String _(int v) => "42";
}

main() {
  test1();
  test2();
  test3();
  test4();
}
