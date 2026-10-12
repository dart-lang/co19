// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
///
/// @description Checks that that it is not an error to declare a constant
/// factory constructor in an extension declaration that has an on-declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {
  final int v;
  const C(this.v);
}

class D extends C {
  const D(super.v);
}

extension type const ET(int v) {}

extension ExtC on C {
  const factory C.foo() => const D(0);

  const factory C.bar(int v) = C.new;
}

extension ExtET on ET {
  const factory ET.baz(int v) = ET.new;
}

main() {
  Expect.equals(0, const C.foo().v);
  Expect.equals(1, const C.bar(1).v);
  Expect.equals(2, const ET.baz(2).v);
}
