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

class C implements I, I, IAlias {
  String get id => "C";
}

mixin M implements I, I, IAlias {
  String get id => "M";
}

enum E implements I, I, IAlias {
  e0;
  String get id => "E";
}

extension type ET(I _) implements I, I, IAlias {}

class MA = Object with M;

main() {
  Expect.equals("C", C().id);
  Expect.equals("M", MA().id);
  Expect.equals("E", E.e0.id);
  Expect.equals("I", ET(I()).id);
}
