// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let L be a library that exports a declaration D named main. It is
/// a compile-time error unless D is a function declaration.
///
/// @description Checks that it is a compile-time error if library exports
/// declaration named main and this declaration is not a function. Test variable
/// @author sgrekhov@unipro.ru
/// @issue 43549

library export_main;

void getVoid() {}

void main = getVoid();
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
