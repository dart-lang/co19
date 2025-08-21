// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can also write external members in extensions of interop
/// types.
///
/// @description Check that it is a compile-time error to declare a static
/// external members of an extension on JS interop type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';

extension type ET._(JSObject _) implements JSObject {
  external ET.fromDart(num value);
}

extension Ext on ET {
  external static int foo();
//                    ^^^
// [analyzer] unspecified
// [web] unspecified
  external static void set bar(String v);
//                         ^^^
// [analyzer] unspecified
// [web] unspecified
  external static int get baz;
//                        ^^^
// [analyzer] unspecified
// [web] unspecified
}

main() {
  print(ET);
}
