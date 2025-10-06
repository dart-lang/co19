// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a library contains two part
/// directives with the same URI.
///
/// @description Checks that it is a compile-time error if a library contains
/// two part directives with the same URI.
/// @author rodionov
/// @issue 46998

part 'uri_t01_part.dart';
part 'uri_t01_part.dart';
//   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(uri_t01_part_var);
}
