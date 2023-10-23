// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is not an error if the representation type of an
/// extension type is a  top type, the type `Null`, a function type, the type
/// `Function`, a record type, the type `Record`, a type of the form `T?` or
/// `FutureOr<T>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "dart:async" show FutureOr;
import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

typedef void Foo();

extension type ET1(dynamic id) {}

extension type ET2(Object id) {}

extension type ET3(Object? id) {}

extension type ET4(Null id) {}

extension type ET5(Foo id) {}

extension type ET6(Function id) {}

extension type ET7((int,) id) {}

extension type ET8(Record id) {}

extension type ET9(int? id) {}

extension type ET10(FutureOr<int> id) {}

Foo foo = () {};

main() {
  Expect.throws(() {ET1("42").id.whatever;});
  ET2(42).id.expectStaticType<Exactly<Object>>();
  ET3(42).id.expectStaticType<Exactly<Object?>>();
  ET4(null).id.expectStaticType<Exactly<Null>>();
  ET5(foo).id.expectStaticType<Exactly<Foo>>();
  ET6(() {}).id.expectStaticType<Exactly<Function>>();
  ET7((42,)).id.expectStaticType<Exactly<(int,)>>();
  ET8((42,)).id.expectStaticType<Exactly<Record>>();
  ET9(null).id.expectStaticType<Exactly<int?>>();
  ET10(42).id.expectStaticType<Exactly<FutureOr<int>>>();
}
