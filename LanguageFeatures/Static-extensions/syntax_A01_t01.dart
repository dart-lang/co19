// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that that it is not an error to declare a redirecting
/// factory constructor in an extension declaration that has an on-declaration.
/// Test named extension and redirecting factory constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

String log = '';

class C.someName() {
  this {
    log = 'C.someName';
  }
}

mixin class MC() {}

extension type ET(int _) implements num {
  this {
    log = 'ET.new';
  }
}

extension ExtC on C {
  factory() = C.someName;
}

extension ExtMC on MC {
  factory someName() = MC.new;
}

extension ExtET on ET {
  factory someName(int _) = ET.new;
}

main() {
  C();
  Expect.equals('C.someName', log);
  MC.someName();
  ET.someName(0);
  Expect.equals('ET.new', log);
}
