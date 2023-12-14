// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that switch expression/statement with a `Map` as a
/// matched type and without an additional exhaustive pattern is not exhaustive
/// @author sgrekhov22@gmail.com

String test1(Map<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    Map(length: <= 0) => "match"
  };

String test2(Map<bool, bool> m) {
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case Map(length: <= 0):
      return "match";
  }
// There is no return statement here, switch statement is not exhaustive, so an
// error above occurs because function return type cannot be null
}

main() {
  print(test1({true: false}));
  print(test2({true: false}));
}
