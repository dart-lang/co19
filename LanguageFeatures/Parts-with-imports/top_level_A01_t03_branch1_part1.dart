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
/// all transitive part files are all in scope in every file. Test that
/// declarations from one branch of a parts tree are available in another branch
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'top_level_A01_t03.dart';
part 'top_level_A01_t03_branch1_part2.dart';

String b1p1Var = "b1p1Var";
String get b1p1Getter => "b1p1Getter";
void set b1p1Setter(String _) {}
String b1p1Func() => "b1p1Func";

class B1p1Class {
  static final id = "B1p1Class";
}

mixin B1p1Mixin {
  static final id = "B1p1Mixin";
}

enum B1p1Enum {
  e0;
  static final id = "B1p1Enum";
}

extension B1p1Ext on A {
  static final id = "B1p1Ext";
}

extension type B1p1ET(int _) {
  static final id = "B1p1ET";
}

testB1p1() {
  // Form top_level_A01_t03_branch2_part1.dart
  Expect.equals("b2p1Var", b2p1Var);
  Expect.equals("b2p1Getter", b2p1Getter);
  b2p1Setter = "x";
  Expect.equals("b2p1Func", b2p1Func);
  Expect.equals("B2p1Class", B2p1Class.id);
  Expect.equals("B2p1Mixin", B2p1Mixin.id);
  Expect.equals("B2p1Enum", B2p1Enum.id);
  Expect.equals("B2p1Ext", B2p1Ext.id);
  Expect.equals("B2p1ET", B2p1ET.id);

  // Form top_level_A01_t03_branch2_part2.dart
  Expect.equals("b2p2Var", b2p2Var);
  Expect.equals("b2p2Getter", b2p2Getter);
  b2p2Setter = "x";
  Expect.equals("b2p2Func", b2p2Func);
  Expect.equals("B2p2Class", B2p2Class.id);
  Expect.equals("B2p2Mixin", B2p2Mixin.id);
  Expect.equals("B2p2Enum", B2p2Enum.id);
  Expect.equals("B2p2Ext", B2p2Ext.id);
  Expect.equals("B2p2ET", B2p2ET.id);
}
