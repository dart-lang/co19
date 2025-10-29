// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// - The parameter name of the parameter in the constructor is the public name
///   `n`. This means that the parameter has a public name in the constructor's
///   function signature, and arguments for this parameter are given using the
///   public name. All uses of the constructor, outside of its own code, see
///   only the public name.
///
/// @description Check that it is a compile-time error to use a private name `p`
/// as the name of the parameter in the constructor invocation. Test declaring
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,declaring-constructors

class C1({var String? _p});

class C2 {
  this({required final String _p});
}

extension type ET1 {
  this({final String? _p});
}

extension type ET2 {
  this({required final String _p});
}

enum E1({final String? _p}) {
  e0(_p: "E1");
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0(_p: "E2");
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

  const this({required final String _p});
}

main() {
  C1(_p: "");
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

  C2(_p: "");
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET1(_p: "");
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(_p: "");
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
