// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the type of [c] may not be assigned
/// to [bool].
/// @description Checks that it is a compile type error if [c] may not be
/// assignable to [bool].
/// @author ngl@unipro.ru


bool b0 = true;

main() {
  assert (b0 ? true : 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
