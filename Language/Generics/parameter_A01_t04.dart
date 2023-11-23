// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///    typeParameter ::= metadata identifier (extends typeNotVoid)?
///    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
/// A type parameter [T] may be suffixed with an [extends] clause that specifies
/// the upper bound for [T].
/// @description Statically checks that [extends] clause specifies upper bound
/// for the class type parameter
/// @author iarkh@unipro.ru

class A {} 
class B extends A {}
class C extends B {}

typedef Alias1<T extends A>(T t);
typedef Alias2<T extends B>(T t);
typedef Alias3<T extends C>(T t);

testme(a) {}

main() {
  Alias1 a1 = testme;
  Alias1<A> a2 = testme;
  Alias1<B> a3 = testme;
  Alias1<C> a4 = testme;

  Alias2 a5 = testme;
  Alias2<A> a6 = testme;
//       ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'A' doesn't conform to the bound 'B' of the type variable 'T' on 'Alias2'.
  Alias2<B> a7 = testme;
  Alias2<C> a8 = testme;

  Alias3 a9 = testme;
  Alias3<A> a10 = testme;
//       ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'A' doesn't conform to the bound 'C' of the type variable 'T' on 'Alias3'.
  Alias3<B> a11 = testme;
//       ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'B' doesn't conform to the bound 'C' of the type variable 'T' on 'Alias3'.
  Alias3<C> a12 = testme;
}
