// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A library variable is implicitly static. It is a compile-time 
/// error to preface a top level variable declaration with the built-in 
/// identifier static.
/// @description Checks that it is a compile-time error if a top level typed 
/// variable declaration is prefaced with the built-in identifier static.
/// @author msyabro


static int foo = 1; // error
//^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  foo = 1;
}
