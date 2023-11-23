// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  abstract int codeUnitAt(int index)
/// @description Check that argument is non nullable
/// @author msyabro


main() {
  "string".codeUnitAt(null);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}
