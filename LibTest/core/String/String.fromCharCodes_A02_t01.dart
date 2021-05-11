// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion null list elements result in compile error
/// @description Check that char code cannot be null
/// @author msyabro


main() {
  new String.fromCharCodes([0, 1, 2, 3, null]);
//                                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
