// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that at type `T` is a type of interest for a variable `x`
/// in a set of tested types `tested` if `tested` contains a type `S` such that
/// `T` is `S`, or `T` is `NonNull(S)`.
///
/// @description Checks that a type `Object` cannot be made a type of interest
/// for a variable.
/// @author sgrekhov22@gmail.com
/// @issue 60620

import 'dart:async';

test1() {
  String s = "a";
  if (s is Object) {}  // Try to make `Object` a type of interest
  s = "b";
  s.substring(0);
}

test2() {
  String s = "a";
  if (s is FutureOr<Object>) {}
  s = "b";
  s.substring(0);
}

test3() {
  String s = "a";
  if (s is Object?) {}
  s = "b";
  s.substring(0);
}

test4() {
  String s = "a";
  if (s is FutureOr<Object?>) {}
  s = "b";
  s.substring(0);
}

main() {
  test1();
  test2();
  test3();
  test4();
}
