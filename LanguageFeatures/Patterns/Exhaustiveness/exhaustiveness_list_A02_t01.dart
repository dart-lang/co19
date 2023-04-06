// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements with a list as a matched type can never be
/// exhaustive
///
/// @description Check that exhaustiveness check is not performed for a switch
/// statement with a list as a matched type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test(List<bool> l) {
//     ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  switch (l) {
    case []:
    case [_]:
    case [_, _]:
    case [_, _, ...]:
      return "ok";
  }
// There is no return statement here, and static analysis doesn't know if the
// switch statement exhaustive or not, so an error above occurs because function
// return type cannot be null
}

main() {
  test([]);
}
