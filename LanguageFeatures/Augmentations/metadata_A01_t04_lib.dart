// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (does not replace it). Test getters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'metadata_A01_t04.dart';

@Meta2() augment String get topLevelGetter;

augment class C {
  @Meta2() augment static String get staticGetter;
  @Meta2() augment String get instanceGetter;
}

augment mixin M {
  @Meta2() augment static String get staticGetter;
  @Meta2() augment String get instanceGetter;
}

augment enum E {
  ;
  @Meta2() augment static String get staticGetter;
  @Meta2() augment String get instanceGetter;
}

augment extension Ext {
  @Meta2() augment static String get staticGetter;
  @Meta2() augment String get instanceGetter;
}

augment extension type ET {
  @Meta2() augment static String get staticGetter;
  @Meta2() augment String get instanceGetter;
}
