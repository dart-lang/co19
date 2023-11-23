// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The static type of a switch expression is the least upper bound of the
/// static types of all of the case expressions. If a switch expression has no
/// cases, its static type is Never.
///
/// @description Check that if a switch expression has no cases, its static type
/// is Never.
/// @author sgrekhov22@gmail.com

sealed class A {}

Never test(A a) {
  return switch (a) {};
}

main() {
  print(test);
}
