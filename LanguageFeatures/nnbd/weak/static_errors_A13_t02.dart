// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call the default List constructor
///
/// @description Check that it is an error to call the default List constructor.
/// Test legacy pre-NNBD types
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

import "legacy_lib.dart";

main() {
  new List<A>(42);
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  new List<A>();
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
