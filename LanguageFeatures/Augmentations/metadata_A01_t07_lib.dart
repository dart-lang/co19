// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test functions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'metadata_A01_t07.dart';

@Meta()
augment void topLevelFunction() {}

augment class C {
  @Meta()
  augment static void staticMethod() {}
  @Meta()
  augment void instanceMethod() {}
}

augment mixin M {
  @Meta()
  augment static void staticMethod() {}
  @Meta()
  augment void instanceMethod() {}
}

augment enum E {
  ;
  @Meta()
  augment static void staticMethod() {}
  @Meta()
  augment void instanceMethod() {}
}

augment extension Ext {
  @Meta()
  augment static void staticMethod() {}
  @Meta()
  augment void instanceMethod() {}
}

augment extension type ET {
  @Meta()
  augment static void staticMethod() {}
  @Meta()
  augment void instanceMethod() {}
}
