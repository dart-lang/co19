// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that 'augmented()` in the body of extension type's
/// implicit constructor doesn't reinitialize the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'extension_types_A02_t10_lib.dart';

extension type ET(int id) {}

main() {
  ET(1);
}
