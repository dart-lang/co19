// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that a constructor whose name is `ET` can be augmented
/// by `ET.new` and vice versa.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'extension_types_A02_t02.dart';

augment extension type ET1 {
  augment ET1.new(this.id) {
    _log = "ET1.new($id)";
  }
}

augment extension type ET2 {
  augment ET2(this.id) {
    _log = "ET2($id)";
  }
}
