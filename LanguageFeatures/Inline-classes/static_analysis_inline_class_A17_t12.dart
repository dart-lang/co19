// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type has a
/// non-extension superinterface whose transitive alias expansion is a type
/// variable, a deferred type, any top type (including dynamic and void), the
/// type Null, any function type, the type Function, any record type, the type
/// Record, or any type of the form T? or FutureOr<T> for any type T.
///
/// @description Checks that it is not an error if an extension type has
/// `implements T` where `T` is a type that denotes a `sealed`, `final`, or
/// `base` class in a different library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "../Extension-types/extension_type_lib.dart";

extension type ET1(BaseClass id) implements BaseClass {}

extension type ET2<T extends FinalClass>(T id) implements FinalClass {}

extension type ET3<T extends SealedClass>(T id) implements SealedClass {}

main() {
  BaseClass bc = BaseClass();
  ET1 et1 = ET1(bc);
  Expect.equals(bc, et1.id);

  FinalClass fc = FinalClass();
  ET2<FinalClass> et2 = ET2<FinalClass>(fc);
  Expect.equals(fc, et2.id);

  ExtendsSealedClass sc = ExtendsSealedClass();
  ET3 et3 = ET3(sc);
  Expect.equals(sc, et3.id);
}
