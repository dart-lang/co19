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
  static final id = "Part2Class";
}

mixin _Part2Mixin {
  static final id = "Part2Mixin";
}

enum _Part2Enum {
  e0;
  static final id = "Part2Enum";
}

extension _Part2Ext on A {
  static final id = "Part2Ext";
}

extension type _Part2ET(int _) {
  static final id = "Part2ET";
}

testPart2() {
  Expect.equals("mainVar", _mainVar);
  Expect.equals("mainGetter", _mainGetter);
  _mainSetter = "x";
  Expect.equals("mainFunc", _mainFunc());
  Expect.equals("MainClass", _MainClass.id);
  Expect.equals("MainMixin", _MainMixin.id);
  Expect.equals("MainEnum", _MainEnum.id);
  Expect.equals("MainExt", _MainExt.id);
  Expect.equals("MainET", _MainET.id);

  Expect.equals("part1Var", _part1Var);
  Expect.equals("part1Getter", _part1Getter);
  _part1Setter = "x";
  Expect.equals("part1Func", _part1Func());
  Expect.equals("Part1Class", _Part1Class.id);
  Expect.equals("Part1Mixin", _Part1Mixin.id);
  Expect.equals("Part1Enum", _Part1Enum.id);
  Expect.equals("Part1Ext", _Part1Ext.id);
  Expect.equals("Part1ET", _Part1ET.id);
}
