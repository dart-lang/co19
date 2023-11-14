// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an equality expression is bool.
///
/// @description Checks that static type of an equality expression is bool.
/// @author msyabro

main() {
  bool b;
  b = (1 == 1);
  b = (1 == 2);
  b = (1 != 3);
  b = (4 != 4);
}
