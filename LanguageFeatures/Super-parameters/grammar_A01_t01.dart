// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend the grammar to:
///
/// <normalFormalParameterNoMetadata> ::= <functionFormalParameter>
///   \alt <fieldFormalParameter>
///   \alt <simpleFormalParameter>
///   \alt <superFormalParameter>         ## new
///
/// <fieldFormalParameter> ::= \gnewline{}
///   <finalConstVarOrType>? \THIS{} `.' <identifier> (<formalParameterPart> `?'?)?
///
/// <superFormalParameter> ::= \gnewline{}                                            ## new
///   <finalConstVarOrType>? \SUPER{} `.' <identifier> (<formalParameterPart> `?'?)?  ## new
/// That is, exactly the same grammar as initializing formals, but with super
/// instead of this.
///
/// @description Check that `super.id` is still not allowed in initializer's
/// list
/// @author sgrekhov@unipro.ru

class S {
  int s1;
  S(this.s1);
}

class C extends S {
  int i;
  C(this.i) : super.s1 = 0;
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42);
}
