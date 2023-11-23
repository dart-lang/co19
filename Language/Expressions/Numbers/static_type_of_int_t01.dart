// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an integer literal is int.
/// @description Checks that integer literal can be assigned to a typed int
/// variable without errors or warnings. Tests big integer values.
/// @note Should be excluded for the web runs.
/// @author iefremov


main() {
  int i = 9223372036854775807;
  i = 0xffffffffffffffff;
}
