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
/// all transitive part files are all in scope in every file. Test that private
/// declarations from one branch of a parts tree are available in another branch
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'top_level_A01_t04.dart';
part 'top_level_A01_t04_branch1_part2.dart';

String _b1p1Var = "_b1p1Var";
String get _b1p1Getter => "_b1p1Getter";
void set _b1p1Setter(String _) {}
String _b1p1Func() => "_b1p1Func";

class _B1p1Class {
  static final id = "_B1p1Class";
}

mixin _B1p1Mixin {
  static final id = "_B1p1Mixin";
}

enum _B1p1Enum {
  e0;
  static final id = "_B1p1Enum";
}

extension _B1p1Ext on A {
  static final id = "_B1p1Ext";
}

extension type _B1p1ET(int _) {
  static final id = "_B1p1ET";
}

testB1p1() {
  // Form top_level_A01_t04_branch2_part1.dart
  Expect.equals("_b2p1Var", _b2p1Var);
  Expect.equals("_b2p1Getter", _b2p1Getter);
  _b2p1Setter = "x";
  Expect.equals("_b2p1Func", _b2p1Func());
  Expect.equals("_B2p1Class", _B2p1Class.id);
  Expect.equals("_B2p1Mixin", _B2p1Mixin.id);
  Expect.equals("_B2p1Enum", _B2p1Enum.id);
  Expect.equals("_B2p1Ext", _B2p1Ext.id);
  Expect.equals("_B2p1ET", _B2p1ET.id);

  // Form top_level_A01_t04_branch2_part2.dart
  Expect.equals("_b2p2Var", _b2p2Var);
  Expect.equals("_b2p2Getter", _b2p2Getter);
  _b2p2Setter = "x";
  Expect.equals("_b2p2Func", _b2p2Func());
  Expect.equals("_B2p2Class", _B2p2Class.id);
  Expect.equals("_B2p2Mixin", _B2p2Mixin.id);
  Expect.equals("_B2p2Enum", _B2p2Enum.id);
  Expect.equals("_B2p2Ext", _B2p2Ext.id);
  Expect.equals("_B2p2ET", _B2p2ET.id);
}
