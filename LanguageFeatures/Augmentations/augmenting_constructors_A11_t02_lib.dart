// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that when bodies of augmenting constructors are executed
/// initializing formals are not re-run (no attempt to reinitialize a final
/// variable already initialized by initializing formals of an introductory
/// constructor).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A11_t02.dart';
import '../../Utils/expect.dart';

augment class C {
  augment C(this.x) {
    Expect.equals("x", x);
  }
}

augment extension type ET {
  augment ET.foo(this.id) {
    Expect.equals("x", id);
  }
}
