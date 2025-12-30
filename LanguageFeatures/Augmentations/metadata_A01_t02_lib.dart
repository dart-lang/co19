// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (not replaces it). Test variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'metadata_A01_t02.dart';

@Meta2()
augment String topLevelVariable;

augment class C {
  @Meta2()
  augment static String staticVariable;
  @Meta2()
  augment String instanceVariable;
}

augment mixin M {
  @Meta2()
  augment static String staticVariable;
  @Meta2()
  augment String instanceVariable;
}

augment enum E {
  ;
  @Meta2()
  augment static String staticVariable;
  @Meta2()
  augment final String instanceVariable;
}

augment extension Ext {
  @Meta2()
  augment static String staticVariable;
}

augment extension type ET {
  @Meta2()
  augment static String staticVariable;
  @Meta2()
  augment final String instanceVariable;
}
