// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static warning if the referenced part declaration p names
/// a library other than the current library as the library to which p belongs.
/// @description Checks that it is a static warning if the referenced part names
/// another library, but not a compile-time error and all definitions from such
/// part are available without errors.
/// @description Checks that it is a compile-time error if there're two part
/// directives referencing the same URI.
/// @author rodionov
/// @issue 46998

library Parts_test_lib;
part "part_2.dart";
part "part_2.dart";
//   ^
// [analyzer] unspecified

main() {
  foo is int;
}
