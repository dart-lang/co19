// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
///
/// @description Checks that that it is not an error to declare a constant
/// redirecting generative constructor in an extension declaration that has an
/// on-declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {
  final int v;
  const C(this.v);
}

extension type const ET(int v) {}

enum E {
  e0(0), e1.baz();

  final int v;
  const E(this.v);
}

extension ExtC on C {
  const C.foo() : this(0);
}

extension ExtET on ET {
  const ET.bar() : this(1);
}

extension ExtE on E {
  const E.baz() : this(2);
}

main() {
  Expect.equals(0, C.foo().v);
  Expect.equals(1, ET.bar().v);
  Expect.equals(2, E.e1.v);
}
