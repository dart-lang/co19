// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We also add . to the tokens that an expression statement cannot
/// start with. This doesn't affect starting with a double literal like `.42`,
/// since that's a different token than a single `.`.
///
/// @description Checks that numerical literal like `.42` is still not an error
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

main() {
  .123;

  (.123);

  var v1 = .123 + 1;

  if (.123 > 0) {}

  const half = .5;

  final zero = 0 - .0;

  .314e+1;

  var pi = .214e+1 + 1;
}
