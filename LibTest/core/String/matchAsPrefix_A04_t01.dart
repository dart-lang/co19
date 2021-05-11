// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Match matchAsPrefix(String string, [int start = 0])
/// Match this pattern against the start of string.
/// ...
/// @description Checks that if str is null then it is a compile error
/// @author sgrekhov@unipro.ru


main() {
  "Lily was here".matchAsPrefix(null, 0);
//                              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

