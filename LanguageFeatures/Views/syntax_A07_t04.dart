// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <viewDeclaration> is added to the grammar, along with
/// some rules for elements used in view declarations:
///
/// <viewDeclaration> ::=
///   'view' 'class' <typeIdentifier> <typeParameters>?
///       <viewPrimaryConstructor>?
///       <interfaces>?
///   '{'
///     (<metadata> <viewMemberDeclaration>)*
///   '}'
///
/// <viewPrimaryConstructor> ::=
///   '(' <type> <identifier> ')'
///
/// <viewMemberDeclaration> ::=
///   <classMemberDefinition>
/// ...
/// That is, every view declares exactly one instance variable, and it is final.
/// A primary constructor (as defined in this document) is just an abbreviated
/// syntax whose desugaring includes a declaration of exactly one final instance
/// variable.
/// ```dart
/// // Using a primary constructor.
/// view class V1(R it) {}
///
/// // Same thing, using a normal constructor.
/// view class V2 {
///   final R it;
///   V2(this.it);
/// }
/// ```
/// There are no special rules for static members in views. They can be declared
/// and called or torn off as usual, e.g., View.myStaticMethod(42).
///
/// @description Checks that if a view declaration has <viewPrimaryConstructor>
/// then this constructor is not a constant one
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

view class View(int id) {
}

main() {
  const v = const View(42);
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
