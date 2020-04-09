/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Members inherited in a class in an opted-in library, which are
 * inherited via a class or mixin defined in a legacy library are viewed with
 * their erased legacy signature, even if they were original defined in an
 * opted-in library. Note that if a class which is defined in a legacy library
 * inherits a member with the same name from multiple super-interfaces, then
 * error checking is done as usual using the legacy typing rules which ignore
 * nullability. This means that it is valid for a legacy class to inherit the
 * same member signature with contradictory nullability information. For the
 * purposes of member lookup within a legacy library, nullability information is
 * ignored, and so it is valid to simply erase the nullability information
 * within the legacy library. When referenced from an opted-in library, the same
 * erasure is performed, and the member is seen at its legacy type.
 *
 * We use legacy subtyping when checking inherited member signature coherence in
 * classes because opted out libraries may bring together otherwise incompatible
 * member signatures without causing an error.
 *
 * @description Check that generic legacy class can inherit two opted in classes
 * with type parameters with contradictory nullability information.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A03_opted_out_lib.dart";

class I1<T extends int?> extends LEGACY_INT_2<T> {}
class I2<T extends int>  extends LEGACY_INT_2<T> {}
class I3<T extends Null> extends LEGACY_INT_2<T> {}

class O1<T extends Object?> extends LEGACY_OBJECT_2<T> {}
class O2<T extends Object > extends LEGACY_OBJECT_2<T> {}
class O3<T extends Null   > extends LEGACY_OBJECT_2<T> {}

class F1<T extends Function?> extends LEGACY_FUNCTION_2<T> {}
class F2<T extends Function > extends LEGACY_FUNCTION_2<T> {}
class F3<T extends Null     > extends LEGACY_FUNCTION_2<T> {}

main() {
 I1();
 I2();
 I3();

 I1<int>();
 I1<int?>();
 I1<Null>();
 I2<int>();
 I3<Null>();

 O1();
 O2();
 O3();

 O1<Object>();
 O1<Object?>();
 O1<Null>();
 O2<Object>();
 O3<Null>();

 F1();
 F2();
 F3();

 F1<Function>();
 F1<Function?>();
 F1<Null>();

 F2<Function>();
 F3<Null>();
}
