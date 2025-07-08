// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can either annotate specific instance members to only wrap
/// those members or you can annotate the entire class, which will include all
/// of its instance members.
///
/// @description Checks that it is a compile-time error to annotate with
/// `JSExport()` an extension type instance members.
/// @author sgrekhov22@gmail.com
/// @issue 61076

import 'dart:js_interop';

@JSExport()
class C {
  final int variable = 42;
}

extension type ET(@JSExport() C c) implements C {
//                ^^^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  String etMethod(String v) => "etMethod($v);";
//       ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  @JSExport()

  String get etGetter => "Some etGetter";
//           ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  void set etSetter(bool value) {
//         ^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  }
}

void main() {
  print(ET);
}
