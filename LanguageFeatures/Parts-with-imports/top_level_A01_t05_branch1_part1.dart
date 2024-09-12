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

part of 'top_level_A01_t05.dart';
part 'top_level_A01_t05_branch1_part2.dart';

String partVar = "partVar";
String get partGetter => "partGetter";
void set partSetter(String _) {}
String partFunc() => "partFunc";

class PartClass {
  static final id = "PartClass";
}

mixin PartMixin {
  static final id = "PartMixin";
}

enum PartEnum {
  e0;
  static final id = "PartEnum";
}

extension PartExt on A {
  static final id = "PartExt";
}

extension type PartET(int _) {
  static final id = "PartET";
}

testB1p1() {
  print(partVar);
  print(partGetter);
  partSetter = "x";
  print(partFunc);
  print(PartClass.id);
  print(PartMixin.id);
  print(PartEnum.id);
  print(PartExt.id);
  print(PartET.id);
}
