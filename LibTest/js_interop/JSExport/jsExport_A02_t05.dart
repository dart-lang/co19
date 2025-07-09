// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion You can either annotate specific instance members to only wrap
/// those members or you can annotate the entire class, which will include all
/// of its instance members.
///
/// @description Checks that it is a compile-time error to annotate extension
/// members with `JSExport()`.
/// @author sgrekhov22@gmail.com
/// @issue 61076

import 'dart:js_interop';

@JSExport()
class C {
  final int variable = 42;
}

extension Ext on C {
  @JSExport()
  String extMethod(String v) => "extMethod($v);";
//       ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  String get extGetter => "extGetter";
//           ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified

  @JSExport()
  void set extSetter(bool value) {
//         ^^^^^^^^^
// [analyzer] unspecified
// [web] unspecified
  }
}

void main() {
  print(C);
}
