// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an integer literal is int.
/// @description Checks that integer literal can be assigned to a typed int
/// variable without errors or warnings. Tests big integer values.
/// @note Should be OK for all the configurations including web.
/// @author iarkh@unipro.ru


main() {
  int i = 0;
  i = 1;
  i = 2137483647;
  i = 2137483647;
}
