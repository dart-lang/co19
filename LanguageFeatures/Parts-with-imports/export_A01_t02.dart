// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any Dart file can contain an `export` directive. It makes no
/// difference which file an `export` is in, its exported declarations (filtered
/// by any `hide` or `show` combinators) are added to the library's single
/// export scope, along with those of any other export directives in the library
/// and all non-private declarations of the library itself. Conflicts are
/// handled as usual (as a compile-time error if it's not the same declaration).
///
/// @description Check that it is a compile-time error to access members of an
/// exported library hidden by `show` and `hide`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import 'export_A01_t02_lib.dart';

main() {
  // From parts_lib.dart
  print(libVar);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(libGetter);
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  libSetter = "x";
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(libFunc);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(LibClass); // Ok
  print(LibMixin);
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(LibEnum);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(LibExt.id);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(LibET);
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  // From scope_lib2.dart
  print(libId); // Ok
  print(lib2Func());
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
