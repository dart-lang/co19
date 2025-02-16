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
/// all transitive part files are all in scope in every file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

import '../../Utils/expect.dart';
part 'top_level_A01_t01_part1.dart';

String mainVar = "mainVar";
String get mainGetter => "mainGetter";
void set mainSetter(String _) {}
String mainFunc() => "mainFunc";

class MainClass {
  static final id = "MainClass";
}

mixin MainMixin {
  static final id = "MainMixin";
}

enum MainEnum {
  e0;
  static final id = "MainEnum";
}

class A {}

extension MainExt on A {
  static final id = "MainExt";
}

extension type MainET(int _) {
  static final id = "MainET";
}

main() {
  Expect.equals("part1Var", part1Var);
  Expect.equals("part1Getter", part1Getter);
  part1Setter = "x";
  Expect.equals("part1Func", part1Func());
  Expect.equals("Part1Class", Part1Class.id);
  Expect.equals("Part1Mixin", Part1Mixin.id);
  Expect.equals("Part1Enum", Part1Enum.id);
  Expect.equals("Part1Ext", Part1Ext.id);
  Expect.equals("Part1ET", Part1ET.id);

  Expect.equals("part2Var", part2Var);
  Expect.equals("part2Getter", part2Getter);
  part2Setter = "x";
  Expect.equals("part2Func", part2Func());
  Expect.equals("Part2Class", Part2Class.id);
  Expect.equals("Part2Mixin", Part2Mixin.id);
  Expect.equals("Part2Enum", Part2Enum.id);
  Expect.equals("Part2Ext", Part2Ext.id);
  Expect.equals("Part2ET", Part2ET.id);
  testPart1();
  testPart2();
}
