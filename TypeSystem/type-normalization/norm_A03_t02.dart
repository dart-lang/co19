// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// NORM(T?) =
///  let S be NORM(T)
///  if S is a top type then S
///  if S is Never then Null
///  if S is Never* then Null
///  if S is Null then Null
///  if S is FutureOr<R> and R is nullable then S
///  if S is FutureOr<R>* and R is nullable then FutureOr<R>
///  if S is R? then R?
///  if S is R* then R?
///  else S?
///
/// @description Checks that if NORM(T) is Never then NORM(T?) = Null
/// @author sgrekhov@unipro.ru

class A<X> {}
class B<X> implements A<X> {}

class C extends B<Never?> implements A<Null> {}

main() {
  new C();
}
