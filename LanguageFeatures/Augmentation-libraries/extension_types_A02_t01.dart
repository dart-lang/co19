// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that augmentation can add a body to an extension type's
/// implicit  constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'extension_types_A02_t01_lib.dart';
import '../../Utils/expect.dart';

String _log = "";

extension type ET1(int id) {}

extension type ET2.foo(int id) {}

extension type ET3.new(int id) {}

main() {
  ET1(1);
  Expect.equals("ET1(1)", _log);
  ET2.foo(2);
  Expect.equals("ET2.foo(2)", _log);
  ET3.new(3);
  Expect.equals("ET3.new(3)", _log);
}
