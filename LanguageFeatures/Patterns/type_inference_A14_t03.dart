// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Null-check or null-assert:
//
// Let N be NonNull(M).
//
// Type-check the subpattern using N as the matched value type.
///
/// @description Check that null-check pattern in refutable context produces no
/// errors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

test(int? x) {
  switch (x) {
    case var y?:
      y.isEven;
      break;
    default:
  }
  if (x case var z?) {
    z.isEven;
  }
}

main() {
  test(42);
  test(null);
}
