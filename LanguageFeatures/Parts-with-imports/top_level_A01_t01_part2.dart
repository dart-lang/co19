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

part of 'top_level_A01_t01_part1.dart';

String part2Var = "part2Var";
String get part2Getter => "part2Getter";
void set part2Setter(String _) {}
String part2Func() => "part2Func";

class Part2Class {
  static final id = "Part2Class";
}

mixin Part2Mixin {
  static final id = "Part2Mixin";
}

enum Part2Enum {
  e0;
  static final id = "Part2Enum";
}

extension Part2Ext on A {
  static final id = "Part2Ext";
}

extension type Part2ET(int _) {
  static final id = "Part2ET";
}

testPart2() {
  Expect.equals("mainVar", mainVar);
  Expect.equals("mainGetter", mainGetter);
  mainSetter = "x";
  Expect.equals("mainFunc", mainFunc);
  Expect.equals("MainClass", MainClass.id);
  Expect.equals("MainMixin", MainMixin.id);
  Expect.equals("MainEnum", MainEnum.id);
  Expect.equals("MainExt", MainExt.id);
  Expect.equals("MainET", MainET.id);

  Expect.equals("part1Var", part1Var);
  Expect.equals("part1Getter", part1Getter);
  part1Setter = "x";
  Expect.equals("part1Func", part1Func);
  Expect.equals("Part1Class", Part1Class.id);
  Expect.equals("Part1Mixin", Part1Mixin.id);
  Expect.equals("Part1Enum", Part1Enum.id);
  Expect.equals("Part1Ext", Part1Ext.id);
  Expect.equals("Part1ET", Part1ET.id);
}
