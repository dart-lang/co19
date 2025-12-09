// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, operator,
/// getter, or setter may be augmented to provide a body or add metadata.
///
/// @description Checks that it is not an error if an augmentation uses a
/// parameter name with a library prefix.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import 'augmentation_libraries_lib.dart' as l;

part of 'augmenting_functions_A01_t13.dart';

augment void topLevelFunction1(l.AL a) {}
augment void topLevelFunction2([l.AL? a]) {}
augment void topLevelFunction3({l.AL? a}) {}
augment void topLevelFunction4({required l.AL a}) {}

augment class C {
  augment static void staticMethod1(l.AL a) {}
  augment static void staticMethod2([l.AL? a]) {}
  augment static void staticMethod3({l.AL? a}) {}
  augment static void staticMethod4({required l.AL a}) {}
  augment void instanceMethod1(l.AL a) {}
  augment void instanceMethod2([l.AL? a]) {}
  augment void instanceMethod3({l.AL? a}) {}
  augment void instanceMethod4({required l.AL a}) {}
}

augment mixin M {
  augment static void staticMethod1(l.AL a) {}
  augment static void staticMethod2([l.AL? a]) {}
  augment static void staticMethod3({l.AL? a}) {}
  augment static void staticMethod4({required l.AL a}) {}
  augment void instanceMethod1(l.AL a) {}
  augment void instanceMethod2([l.AL? a]) {}
  augment void instanceMethod3({l.AL? a}) {}
  augment void instanceMethod4({required l.AL a}) {}
}

augment enum E {
  ;
  augment static void staticMethod1(l.AL a) {}
  augment static void staticMethod2([l.AL? a]) {}
  augment static void staticMethod3({l.AL? a}) {}
  augment static void staticMethod4({required l.AL a}) {}
  augment void instanceMethod1(l.AL a) {}
  augment void instanceMethod2([l.AL? a]) {}
  augment void instanceMethod3({l.AL? a}) {}
  augment void instanceMethod4({required l.AL a}) {}
}

augment extension Ext {
  augment static void staticMethod1(l.AL a) {}
  augment static void staticMethod2([l.AL? a]) {}
  augment static void staticMethod3({l.AL? a}) {}
  augment static void staticMethod4({required l.AL a}) {}
  augment void instanceMethod1(l.AL a) {}
  augment void instanceMethod2([l.AL? a]) {}
  augment void instanceMethod3({l.AL? a}) {}
  augment void instanceMethod4({required l.AL a}) {}
}

augment extension type ET {
  augment static void staticMethod1(l.AL a) {}
  augment static void staticMethod2([l.AL? a]) {}
  augment static void staticMethod3({l.AL? a}) {}
  augment static void staticMethod4({required l.AL a}) {}
  augment void instanceMethod1(l.AL a) {}
  augment void instanceMethod2([l.AL? a]) {}
  augment void instanceMethod3({l.AL? a}) {}
  augment void instanceMethod4({required l.AL a}) {}
}
