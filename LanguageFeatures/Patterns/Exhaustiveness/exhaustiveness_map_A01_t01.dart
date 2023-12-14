// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Exhaustiveness with map patterns can only be achieved when there
/// is an exhaustive pattern in addition to any map patterns
///
/// @description Check that switch expression/statement with map patterns only
/// cannot be exhaustive
/// @author sgrekhov22@gmail.com

String test1(Map<bool, bool> m) =>
  switch (m) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    {true: true} => "case-1",
    {true: false} => "case-2",
    {false: true} => "case-3",
    {false: false} => "case-4",
  };

String test2(Map<bool, bool> m) {
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (m) {
    case {true: true}:
      return "case-1";
    case {true: false}:
      return "case-2";
    case {false: true}:
      return "case-3";
    case {false: false}:
      return "case-4";
  }
// There is no return statement here, switch statement is not exhaustive, so an
// error above occurs because function return type cannot be null
}

main() {
  print(test1({true: false}));
  print(test2({true: false}));
}
