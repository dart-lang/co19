// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - A function is not complete after all augmentations are applied, unless
///   it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is not an error if a function is made complete
/// by an augmentation by adding a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'augmenting_functions_A08_t02.dart';

augment String topLevelFunction1();
augment String topLevelFunction2([int v = 2]);
augment String topLevelFunction3({int v = 3});

augment class C {
  augment String staticMethod1();
  augment String staticMethod2([int v = 2]);
  augment String staticMethod3({int v = 3});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 2]);
  augment String instanceMethod3({int v = 3});
}

augment mixin M {
  augment String staticMethod1();
  augment String staticMethod2([int v = 2]);
  augment String staticMethod3({int v = 3});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 2]);
  augment String instanceMethod3({int v = 3});
}

augment enum E {
  ;
  augment String staticMethod1();
  augment String staticMethod2([int v = 2]);
  augment String staticMethod3({int v = 3});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 2]);
  augment String instanceMethod3({int v = 3});
}

class A {}

augment extension Ext {
  augment String staticMethod1();
  augment String staticMethod2([int v = 2]);
  augment String staticMethod3({int v = 3});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 2]);
  augment String instanceMethod3({int v = 3});
}

augment extension type ET {
  augment String staticMethod1();
  augment String staticMethod2([int v = 2]);
  augment String staticMethod3({int v = 3});

  augment String instanceMethod1();
  augment String instanceMethod2([int v = 2]);
  augment String instanceMethod3({int v = 3});
}
