// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Optional parameters may be specified and provided with default
/// values.
/// ⟨defaultFormalParameter⟩ ::= ⟨normalFormalParameter⟩ (‘=’ ⟨expression⟩)?
///
/// ⟨defaultNamedParameter⟩ ::=
///         ⟨metadata⟩ required? ⟨normalFormalParameterNoMetadata⟩
///         (‘=’ ⟨expression⟩)?
/// ;
///
/// @description Checks that it is not an error if the name of a positional
/// optional parameter name starts with an '_' character.
/// @author msyabro

main() {
  void func([int? _x]) {}
  func(1);
}
