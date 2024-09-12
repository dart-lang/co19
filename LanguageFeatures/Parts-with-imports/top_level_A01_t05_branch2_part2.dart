// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Library member declarations are library-global: All top-level
/// declarations in the library file and all transitive part files are equal,
/// and are all in scope in every file. They introduce declarations into the
/// library’s declaration scope, which is the most significant scope in all
/// files of the library. If there is any conflict with imported names,
/// top-level declarations win!
///
/// @description Check that all top-level declarations in the library file and
/// all transitive part files are all in scope in every file. Test that it is a
/// compile-time error to have a top-level declarations with the same name in a
/// different branches of a parts tree.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'top_level_A01_t05_branch2_part1.dart';

String _partVar = "_partVar";
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String get _partGetter => "_partGetter";
//         ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void set _partSetter(String _) {}
//       ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
String _partFunc() => "_partFunc";
//     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class _PartClass {
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final id = "_PartClass";
}

mixin _PartMixin {
//    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final id = "_PartMixin";
}

enum _PartEnum {
//   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
  static final id = "_PartEnum";
}

extension _PartExt on A {
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final id = "_PartExt";
}

extension type _PartET(int _) {
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static final id = "_PartET";
}

testB2p2() {
  print(_partVar);
  print(_partGetter);
  _partSetter = "x";
  print(_partFunc);
  print(_PartClass.id);
  print(_PartMixin.id);
  print(_PartEnum.id);
  print(_PartExt.id);
  print(_PartET.id);
}
