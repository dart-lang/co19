// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (does not replace it). Test setters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'metadata_A01_t06.dart';

@Meta2()
augment void set topLevelSetter(String _) {}

augment class C {
  @Meta2()
  augment static void set staticSetter(String _) {}
  @Meta2()
  augment void set instanceSetter(String _) {}
}

augment mixin M {
  @Meta2()
  augment static void set staticSetter(String _) {}
  @Meta2()
  augment void set instanceSetter(String _) {}
}

augment enum E {
  ;
  @Meta2()
  augment static void set staticSetter(String _) {}
  @Meta2()
  augment void set instanceSetter(String _) {}
}

augment extension Ext {
  @Meta2()
  augment static void set staticSetter(String _) {}
  @Meta2()
  augment void set instanceSetter(String _) {}
}

augment extension type ET {
  @Meta2()
  augment static void set staticSetter(String _) {}
  @Meta2()
  augment void set instanceSetter(String _) {}
}
