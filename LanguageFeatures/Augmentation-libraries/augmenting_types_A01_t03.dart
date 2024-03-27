// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
///
/// - The augmenting type and corresponding type are not the same kind: class,
///   mixin, enum, or extension. You can't augment a class with a mixin, etc.
///
/// @description Checks that it is not an error if an augmenting type and the
/// corresponding type are the same kind. Test type aliases
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
import augment 'augmenting_types_A01_t03_lib.dart';

class C {}

mixin M {}

enum E {e1;}

typedef CAlias = C;
typedef MAlias = M;
typedef EAlias = E;

class MA = Object with M;

main() {
  Expect.equals("C", C().foo());
  Expect.equals("C", CAlias().foo());
  Expect.equals("M", MA().foo());
  Expect.equals("E", E.e1.foo());
  Expect.equals("E", EAlias.e1.foo());
}
