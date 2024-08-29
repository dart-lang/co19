// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that an identifier reference of the form `_` in a string
/// literal does not resolve to a local variable which is a wildcard since there
/// is no such binding.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

main() {
  var _ = "Wildcard";

  print("$_");
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  print("${_}");
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}
