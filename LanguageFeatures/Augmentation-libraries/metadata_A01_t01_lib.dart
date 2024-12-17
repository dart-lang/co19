// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All declarations can be augmented with metadata annotations
/// and/or doc comments directly preceding an augmenting declaration.
///
/// In both cases, these should be appended to existing metadata or doc
/// comments. For metadata annotations, these may trigger additional macro
/// applications.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'metadata_A01_t01.dart';

@Meta() augment String topLevelVariable;

augment class C {
  @Meta() augment static String staticVariable;
  @Meta() augment String instanceVariable;
}

augment mixin M {
  @Meta() augment static String staticVariable;
  @Meta() augment String instanceVariable;
}

augment enum E {
  augment e0;
  @Meta() augment static String staticVariable;
  @Meta() augment String instanceVariable;
}

augment extension Ext {
  @Meta() augment static String staticVariable;
}

augment extension type ET {
  @Meta() augment static String staticVariable;
}
