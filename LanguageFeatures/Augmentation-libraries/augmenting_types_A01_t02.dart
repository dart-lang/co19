// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
///
/// - The augmenting type and corresponding type are not the same kind: class,
///   mixin, enum, or extension. You can't augment a class with a mixin, etc.
///
/// @description Checks that it is a compile-time error if an augmenting type is
/// a type alias of a different type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A01_t02_lib1.dart';
import augment 'augmenting_types_A01_t02_lib2.dart';

class C {}

mixin M {}

enum E {e1;}

typedef CAlias = C;
typedef MAlias = M;
typedef EAlias = E;

main() {
  print(CAlias);
  print(MAlias);
  print(EAlias);
}
