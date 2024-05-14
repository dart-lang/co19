// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test for-loop variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

main() {
  for (var _ = 1, _ = 2;;) {
    break;
  }
  for (var _, _;;) {
    break;
  }
  for (final _ = 1, _ = 2;;) {
    break;
  }
  for (int _ = 0, _ = 1;;) {
    break;
  }
  for(int? _, _ = 1;;) {
    break;
  }
}
