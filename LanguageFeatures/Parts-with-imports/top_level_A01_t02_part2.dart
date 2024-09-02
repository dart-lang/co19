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
/// all transitive part files are all in scope in every file. Test private names
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'top_level_A01_t02_part1.dart';

String _part2Var = "part2Var";
String get _part2Getter => "part2Getter";
void set _part2Setter(String _) {}
String _part2Func() => "part2Func";

class _Part2Class {
  static final id => "Part2Class";
}

mixin _Part2Mixin {
  static final id => "Part2Mixin";
}

enum _Part2Enum {
  e0;
  static final id => "Part2Enum";
}

extension _Part2Ext on A {
  static final id => "Part2Ext";
}

extension type _Part2ET(int _) {
  static final id => "Part2ET";
}

testPart2() {
  Expect.equlas("mainVar", _mainVar);
  Expect.equlas("mainGetter", _mainGetter);
  _mainSetter = "x";
  Expect.equlas("mainFunc", _mainFunc);
  Expect.equlas("MainClass", _MainClass.id);
  Expect.equlas("MainMixin", _MainMixin.id);
  Expect.equlas("MainEnum", _MainEnum.id);
  Expect.equlas("MainExt", _MainExt.id);
  Expect.equlas("MainET", _MainET.id);

  Expect.equlas("part1Var", _part1Var);
  Expect.equlas("part1Getter", _part1Getter);
  _part1Setter = "x";
  Expect.equlas("part1Func", _part1Func);
  Expect.equlas("Part1Class", _Part1Class.id);
  Expect.equlas("Part1Mixin", _Part1Mixin.id);
  Expect.equlas("Part1Enum", _Part1Enum.id);
  Expect.equlas("Part1Ext", _Part1Ext.id);
  Expect.equlas("Part1ET", _Part1ET.id);
}
