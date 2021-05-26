// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a static warning if the static type F of ef may not
/// be assigned to a function type.
/// @description Checks that it is a compile error if the static type F of ef
/// may not be assigned to a function type.
/// @author msyabro
/// @reviewer rodionov


main() {
  int e = 1;
  e();
//^
// [analyzer] unspecified
// [cfe] unspecified
}
