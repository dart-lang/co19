// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, in an extension declaration that has an on-declaration.
///
/// @description Checks that that it is not an error to declare a
/// non-redirecting factory constructor in an extension declaration that has an
/// on-declaration. Test unnamed extensions and non-redirecting factory
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C.someName(var int v) {}

mixin class MC() {}

enum E {
  e0;
}

extension type ET.someName(int v) implements num {}

extension on C {
  factory() => C.someName(1);
}

extension on MC {
  factory someName() => MC();
}

extension on E {
  factory someName() => E.e0;
}

extension on ET {
  factory() => ET(2);
}

extension on Record {
  factory() => (42,);
}

extension on Function {
  factory someName() => foo;
}

void foo() {}

main() {
  Expect.equals(1, C().v);
  MC.someName();
  Expect.equals(E.e0, E.someName());
  Expect.equals(2, ET().v);
  Expect.equals((42,), Record());
  Expect.equals(foo, Function());
}
