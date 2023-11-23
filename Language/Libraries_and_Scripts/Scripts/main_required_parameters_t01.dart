// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let L be a library that exports a declaration D named main.
/// ...
/// It is a compile-time error if D declares more than two required positional
/// parameters, or if there are any required named parameters.
///
/// @description Checks that it is a compile-time error if function 'main' has
/// more that two required positional parameters
/// @author sgrekhov@unipro.ru
/// @issue 43551

void main(List<String> args, var i, var j) {
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
