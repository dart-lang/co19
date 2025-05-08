// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that at type `T` is a type of interest for a variable `x`
/// in a set of tested types `tested` if `tested` contains a type `S` such that
/// `T` is `S`, or `T` is `NonNull(S)`.
///
/// @description Checks that the list of types of interests always contains
/// `NonNull(declared)`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? o) {
  o = Object();
  o.expectStaticType<Exactly<Object>>();
}

test2(Object? o) {
  o = 42;
  // `int` is not a type of interest for `o` but `int <: Object` therefore `o`
  // is promoted to `Object`
  o.expectStaticType<Exactly<Object>>();
}

test3(Pattern? o) {
  o = "";
  o.expectStaticType<Exactly<Pattern>>();
}

main() {
  test1("");
  test1(null);
  test2("");
  test2(null);
  test3("");
  test3(null);
}
