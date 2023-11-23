// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let L be a library that exports a declaration D named main. It is
/// a compile-time error unless D is a function declaration.
///
/// @description Checks that it is a compile error if L declares a top-level
/// getter named main, returning a function.
/// @author ngl@unipro.ru
/// @issue 42492

var x = 42;

get main => () {
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(x);
};
