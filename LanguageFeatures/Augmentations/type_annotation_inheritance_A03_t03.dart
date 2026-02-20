// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's not an error if an abstract final variable
/// augments a getter and there is a setter with the same name but different
/// type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

// TODO(sgrekhov): This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

import '../../Utils/expect.dart';

class C {
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment class C {
  augment abstract final instanceVariable;
}

mixin M {
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment mixin M {
  augment abstract final instanceVariable;
}

class MA = Object with M;

main() {
  Expect.equals(42, C().instanceVariable);
  Expect.equals(42, MA().instanceVariable);
}
