// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the contents of the URI are not a
/// valid part declaration.
///
/// @description Checks that it is a compile-time error when a part file
/// contains a library definition instead of a part declaration.
/// @author rodionov

part "uri_contents_t02_part.dart";
//   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  var x = foo;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
