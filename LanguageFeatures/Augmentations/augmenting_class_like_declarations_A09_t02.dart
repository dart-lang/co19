// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that an introductory class-like declarations may have
/// ';' as a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C;
augment class C {
  String get id => 'C';
}

mixin M;
augment mixin M {
  String get id => 'M';
}

enum E;

augment enum E {
  e0;
  String get id => 'E';
}

class A {}
extension Ext on A;

augment extension Ext {
  String get id => 'Ext';
}

extension type ET(int _);

augment extension type ET {
  String get id => 'ET';
}

class MA = Object with M;

main() {
  Expect.equals('C', C().id);
  Expect.equals('M', MA().id);
  Expect.equals('E', E.e0.id);
  Expect.equals('Ext', A().id);
  Expect.equals('ET', ET(0).id);
}
