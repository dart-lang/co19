// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Passing null as either argument results in compile error
/// @description Check that it is a compile error to pass null argument
/// @author msyabro


main() {
  "aaa".replaceFirst("a", null);
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  "aaa".replaceFirst(null, "");
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

