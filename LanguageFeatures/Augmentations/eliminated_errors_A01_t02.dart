// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, it is no longer an error to have the following
/// situations:
/// - An `implements` clause contains two or more type operands denoting the
///   same type.
///
/// @description Checks that it is not an error if an `implements` clause
/// contains two or more type operands denoting the same type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class I {
  String get id => "I";
}
typedef IAlias = I;

class C implements I {
  String get id => "C";
}
augment class C implements I, I {}
augment class C implements IAlias {}

mixin M implements I {
  String get id => "M";
}
augment mixin M implements I, I {}
augment mixin M implements IAlias {}

enum E implements I {
  e0;
  String get id => "E";
}
augment enum E implements I, I {;}
augment enum E implements IAlias {;}


extension type ET(I _) implements I {}
augment extension type ET implements I, I {}
augment extension type ET implements IAlias {}

class MA = Object with M;

main() {
  Expect.equals("C", C().id);
  Expect.equals("M", MA().id);
  Expect.equals("E", E.e0.id);
  Expect.equals("I", ET(I()).id);
}
