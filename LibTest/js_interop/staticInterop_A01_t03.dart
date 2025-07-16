// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `staticInterop` enables the JS annotated class to be treated as
/// a "static" interop class.
///
/// These classes allow interop with native types, like the ones in `dart:html`.
/// These classes should not contain any instance members, inherited or
/// otherwise, and should instead use static extension members.
///
/// @description Checks that it is a compile-time error if an extension type is
/// annotated with `@staticInterop`.
/// @author sgrekhov22@gmail.com
/// @issue 61119

import 'dart:js_interop';

class C {}

@staticInterop
@JS()
extension Ext on C {
//        ^^^
// [analyzer] unspecified
// [web] unspecified
  external String getString();
  external int getNumber();
  external bool getBool();
}

main() {
  print(C);
}
