// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if a case of a switch statement may complete
/// normally. The previous syntactic restriction requiring the last statement of
/// each case to be one of an enumerated list of statements (break, continue,
/// return, throw, or rethrow) is removed.
///
/// @description Check that it is not an error if a case of a switch statement
/// may complete normally, even when it's not the last or `default` case. Test
/// the case when `default` case is present
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
