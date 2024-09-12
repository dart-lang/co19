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
part 'top_level_A01_t03_branch2_part2.dart';

String b2p1Var = "b2p1Var";
String get b2p1Getter => "b2p1Getter";
void set b2p1Setter(String _) {}
String b2p1Func() => "b2p1Func";

class B2p1Class {
  static final id = "B2p1Class";
}

mixin B2p1Mixin {
  static final id = "B2p1Mixin";
}

enum B2p1Enum {
  e0;
  static final id = "B2p1Enum";
}

extension B2p1Ext on A {
  static final id = "B2p1Ext";
}

extension type B2p1ET(int _) {
  static final id = "B2p1ET";
}

testB2p1() {
  // Form top_level_A01_t03_branch1_part1.dart
  Expect.equals("b1p1Var", b1p1Var);
  Expect.equals("b1p1Getter", b1p1Getter);
  b1p1Setter = "x";
  Expect.equals("b1p1Func", b1p1Func);
  Expect.equals("B1p1Class", B1p1Class.id);
  Expect.equals("B1p1Mixin", B1p1Mixin.id);
  Expect.equals("B1p1Enum", B1p1Enum.id);
  Expect.equals("B1p1Ext", B1p1Ext.id);
  Expect.equals("B1p1ET", B1p1ET.id);

  // Form top_level_A01_t03_branch1_part2.dart
  Expect.equals("b1p2Var", b1p2Var);
  Expect.equals("b1p2Getter", b1p2Getter);
  b1p2Setter = "x";
  Expect.equals("b1p2Func", b1p2Func);
  Expect.equals("B1p2Class", B1p2Class.id);
  Expect.equals("B1p2Mixin", B1p2Mixin.id);
  Expect.equals("B1p2Enum", B1p2Enum.id);
  Expect.equals("B1p2Ext", B1p2Ext.id);
  Expect.equals("B1p2ET", B1p2ET.id);
}
