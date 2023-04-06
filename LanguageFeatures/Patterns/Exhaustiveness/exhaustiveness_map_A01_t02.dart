// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with map as a matched type can
/// never be exhaustive
///
/// @description Check that map pattern cannot be exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

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
