// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DateTime add(Duration duration)
/// Returns a new DateTime with the duration added to this.
/// @description Checks that compile error appears if the argument is [null].
/// @author iarkh


 main() {
  new DateTime(2000, 1, 1, 0, 0, 0, 0).add(null);
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified

}
