// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile error if a function contains both one or more
/// return statements of the form return; and one or more return statements of
/// the form return e;.
///
/// @description Checks that it is a compile error if a function literal has
/// explicit return statements of different kind.
/// @Issue 39476, 42459
/// @author ilya


main() {
  (x) {
    if (x)
      return 1;
    else
      return;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  } (true);
}
