// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that C<X1 extends B1 . . . , Xm extends Bm> is the name
/// and formal type parameters of the enclosing class, const? is const or empty,
/// N is C or C.id0 for some identifier id0, and id is an identifier, then
/// consider a declaration of a redirecting factory constructor k of one of the
/// forms
/// const? factory
///     N(T1 x1 . . . , Tn xn, [Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk]) = R;
/// const? factory
///     N(T1 x1 . . . , Tn xn, {Tn+1 xn+1=d1, . . . , Tn+k xn+k=dk}) = R;
/// where R is of one of the forms T<S1 . . . , Sp> or T<S1 . . . , Sp>.id.
/// ...
/// The redirectee constructor for this declaration is the constructor k′
/// denoted by R.
/// ...
/// It is a compile error if the function type of k' is not a subtype of the
/// type of k.
///
/// @description Checks that it is a compile-time error is if a factory
/// constructor redirects to a constructor whose type is not a subtype of the
/// factory's function type. Checks extension type
/// @author sgrekhov22@gmail.com
/// @issue 53934

enum Bool {
  _true._(true),
  _false._(false);
  final bool isTrue;
  const Bool._(this.isTrue);
  const factory Bool(bool value) = _BoolHelper;
//                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const _BoolHelper._(Bool _) { // missed implements Bool
  const _BoolHelper(bool isTrue) : this._(isTrue ? Bool._true : Bool._false);
}

main() {
  print(Bool);
}
