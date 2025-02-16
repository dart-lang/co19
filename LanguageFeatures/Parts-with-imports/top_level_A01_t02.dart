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

import '../../Utils/expect.dart';
part 'top_level_A01_t02_part1.dart';

String _mainVar = "mainVar";
String get _mainGetter => "mainGetter";
void set _mainSetter(String _) {}
String _mainFunc() => "mainFunc";

class _MainClass {
  static final id = "MainClass";
}

mixin _MainMixin {
  static final id = "MainMixin";
}

enum _MainEnum {
  e0;
  static final id = "MainEnum";
}

class A {}

extension _MainExt on A {
  static final id = "MainExt";
}

extension type _MainET(int _) {
  static final id = "MainET";
}

main() {
  Expect.equals("part1Var", _part1Var);
  Expect.equals("part1Getter", _part1Getter);
  _part1Setter = "x";
  Expect.equals("part1Func", _part1Func());
  Expect.equals("Part1Class", _Part1Class.id);
  Expect.equals("Part1Mixin", _Part1Mixin.id);
  Expect.equals("Part1Enum", _Part1Enum.id);
  Expect.equals("Part1Ext", _Part1Ext.id);
  Expect.equals("Part1ET", _Part1ET.id);

  Expect.equals("part2Var", _part2Var);
  Expect.equals("part2Getter", _part2Getter);
  _part2Setter = "x";
  Expect.equals("part2Func", _part2Func());
  Expect.equals("Part2Class", _Part2Class.id);
  Expect.equals("Part2Mixin", _Part2Mixin.id);
  Expect.equals("Part2Enum", _Part2Enum.id);
  Expect.equals("Part2Ext", _Part2Ext.id);
  Expect.equals("Part2ET", _Part2ET.id);
  testPart1();
  testPart2();
}
