// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  It is a compile-time error to reference a local function
/// before its declaration.
/// @description Checks that it is a compile-error to reference a local function
/// before its declaration.
/// @author kaigorodov
/// @reviewer rodionov
/// @note renamed from 04_Local_Function_Declaration_A02_t02

main() {
  func();
//^
// [analyzer] unspecified
// [cfe] unspecified
  void func() {}
}
