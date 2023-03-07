// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if any case of a switch statement except the
/// last case (the default case if present) may complete normally. The previous
/// syntactic restriction requiring the last statement of each case to be one of
/// an enumerated list of statements (break, continue, return, throw, or rethrow)
/// is removed.
///
/// @description Check that it is not an error if any case of a switch statement
/// except the last case (the default case if present) may complete normally
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=patterns

void foo() {}

main() {
  int i = 42;
  switch (i) {
    case 1:
      true;
    case 2:
      foo();
    default:
      false;
  }
}
