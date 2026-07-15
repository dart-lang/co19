// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer an error to declare a factory constructor,
/// redirecting or not, or a redirecting generative constructor in an extension
/// declaration that has an on-declaration (defined later in this section), and
/// both kinds can be constant or not.
///
/// @description Checks that that it is not an error to declare a redirecting
/// generative constructor in an extension declaration that has an
/// on-declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C {
  int v;
  C(this.v);
}

extension type ET(int v) {}

extension ExtC on C {
  C.foo() : this(0);
}

extension ExtET on ET {
  ET.bar() : this(1);
}

main() {
  Expect.equals(0, C.foo().v);
  Expect.equals(1, ET.bar().v);
}
