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

part of 'top_level_A01_t02.dart';
part 'top_level_A01_t02_part2.dart';

String _part1Var = "part1Var";
String get _part1Getter => "part1Getter";
void set _part1Setter(String _) {}
String _part1Func() => "part1Func";

class _Part1Class {
  static final id = "Part1Class";
}

mixin _Part1Mixin {
  static final id = "Part1Mixin";
}

enum _Part1Enum {
  e0;
  static final id = "Part1Enum";
}

extension _Part1Ext on A {
  static final id = "Part1Ext";
}

extension type _Part1ET(int _) {
  static final id = "Part1ET";
}

testPart1() {
  Expect.equals("mainVar", _mainVar);
  Expect.equals("mainGetter", _mainGetter);
  _mainSetter = "x";
  Expect.equals("mainFunc", _mainFunc());
  Expect.equals("MainClass", _MainClass.id);
  Expect.equals("MainMixin", _MainMixin.id);
  Expect.equals("MainEnum", _MainEnum.id);
  Expect.equals("MainExt", _MainExt.id);
  Expect.equals("MainET", _MainET.id);

  Expect.equals("part2Var", _part2Var);
  Expect.equals("part2Getter", _part2Getter);
  _part2Setter = "x";
  Expect.equals("part2Func", _part2Func());
  Expect.equals("Part2Class", _Part2Class.id);
  Expect.equals("Part2Mixin", _Part2Mixin.id);
  Expect.equals("Part2Enum", _Part2Enum.id);
  Expect.equals("Part2Ext", _Part2Ext.id);
  Expect.equals("Part2ET", _Part2ET.id);
}
