// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let’s introduce importsOf(S), where S is a set of `import`
/// directives from a single Dart file, to refer to that computation, which
/// introduces a scope containing the declarations introduced by all the
/// `import`s (the declarations of the export scope of each imported library,
/// minus those hidden by a `show` or `hide` operator, combined such that a name
/// conflicts of different declarations is not an error, but the name is marked
/// as conflicted in the scope, and then referencing it is an error.)
///
/// @description Check that it is a compile-time error to access re-exported
/// members hidden by implicit `hide` and `show`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A02_t07.dart';

import 'scope_lib4.dart';

testPart1() {
  // From scope_lib1.dart
  print(_libVar);
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_libGetter);
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  _libSetter = "";
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_libFunc);
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_LibClass); // Ok
  print(_LibMixin);
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_LibEnum);
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_LibExt.id);
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(_LibET);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // From scope_lib2.dart
  print(libId); // Ok
  print(lib2Func());
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  // From scope_lib4.dart
  print(lib4Func()); // Ok
}
