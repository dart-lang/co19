// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that an augmentation can add a body to an extension
/// type's implicit constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'extension_types_A02_t01.dart';

augment extension type ET1 {
  augment ET1(this.id) {
    _log = "ET1($id)";
  }
}

augment extension type ET2 {
  augment ET2.foo(this.id) {
    _log = "ET2.foo($id)";
  }
}

augment extension type ET3 {
  augment ET3.new(this.id) {
    _log = "ET3.new($id)";
  }
}
