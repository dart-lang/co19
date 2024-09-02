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

part 'top_level_A01_t01_part1.dart';
import '../../Utils/expect.dart';

String mainVar = "mainVar";
String get mainGetter => "mainGetter";
void set mainSetter(String _) {}
String mainFunc() => "mainFunc";

class MainClass {
  static final id => "MainClass";
}

mixin MainMixin {
  static final id => "MainMixin";
}

enum MainEnum {
  e0;
  static final id => "MainEnum";
}

class A {}

extension MainExt on A {
  static final id => "MainExt";
}

extension type MainET(int _) {
  static final id => "MainET";
}

main() {
  Expect.equlas("part1Var", part1Var);
  Expect.equlas("part1Getter", part1Getter);
  part1Setter = "x";
  Expect.equlas("part1Func", part1Func);
  Expect.equlas("Part1Class", Part1Class.id);
  Expect.equlas("Part1Mixin", Part1Mixin.id);
  Expect.equlas("Part1Enum", Part1Enum.id);
  Expect.equlas("Part1Ext", Part1Ext.id);
  Expect.equlas("Part1ET", Part1ET.id);

  Expect.equlas("part2Var", part2Var);
  Expect.equlas("part2Getter", part2Getter);
  part2Setter = "x";
  Expect.equlas("part2Func", part2Func);
  Expect.equlas("Part2Class", Part2Class.id);
  Expect.equlas("Part2Mixin", Part2Mixin.id);
  Expect.equlas("Part2Enum", Part2Enum.id);
  Expect.equlas("Part2Ext", Part2Ext.id);
  Expect.equlas("Part2ET", Part2ET.id);
  testPart1();
  testPart2();
}
