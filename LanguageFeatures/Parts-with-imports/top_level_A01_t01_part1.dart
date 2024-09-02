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

part of 'top_level_A01_t01.dart';
part 'top_level_A01_t01_part2.dart';

String part1Var = "part1Var";
String get part1Getter => "part1Getter";
void set part1Setter(String _) {}
String part1Func() => "part1Func";

class Part1Class {
  static final id => "Part1Class";
}

mixin Part1Mixin {
  static final id => "Part1Mixin";
}

enum Part1Enum {
  e0;
  static final id => "Part1Enum";
}

extension Part1Ext on A {
  static final id => "Part1Ext";
}

extension type Part1ET(int _) {
  static final id => "Part1ET";
}

testPart1() {
  Expect.equlas("mainVar", mainVar);
  Expect.equlas("mainGetter", mainGetter);
  mainSetter = "x";
  Expect.equlas("mainFunc", mainFunc);
  Expect.equlas("MainClass", MainClass.id);
  Expect.equlas("MainMixin", MainMixin.id);
  Expect.equlas("MainEnum", MainEnum.id);
  Expect.equlas("MainExt", MainExt.id);
  Expect.equlas("MainET", MainET.id);

  Expect.equlas("part2Var", part2Var);
  Expect.equlas("part2Getter", part2Getter);
  part2Setter = "x";
  Expect.equlas("part2Func", part2Func);
  Expect.equlas("Part2Class", Part2Class.id);
  Expect.equlas("Part2Mixin", Part2Mixin.id);
  Expect.equlas("Part2Enum", Part2Enum.id);
  Expect.equlas("Part2Ext", Part2Ext.id);
  Expect.equlas("Part2ET", Part2ET.id);
}
