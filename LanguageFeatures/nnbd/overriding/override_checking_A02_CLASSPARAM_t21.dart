/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if generic opted-in class implements two classes (one
 * is legacy), child opted-in class type parameter can extend non-nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "override_checking_A02_opted_out_lib.dart";

class OPTED_CLASS_INT<T extends int>                             {}
class OPTED_CLASS_OBJECT<T extends Object>                       {}
class OPTED_CLASS_FUNCTION<T extends Function>                   {}

class OptedInt<T extends int> implements LEGACY_CLASS_INT<T>, OPTED_CLASS_INT<T> {
  dynamic getParamType() => T;
}

class OptedObject<T extends Object> implements LEGACY_CLASS_OBJECT<T>, OPTED_CLASS_OBJECT<T> {
  dynamic getParamType() => T;
}

class OptedFunction<T extends Function> implements LEGACY_CLASS_FUNCTION<T>, OPTED_CLASS_FUNCTION<T> {
  dynamic getParamType() => T;
}

main() {
  Expect.equals(typeOf<int>(), OptedInt().getParamType());
  Expect.equals(typeOf<int>(), OptedInt<int>().getParamType());

  Expect.equals(typeOf<Object>(), OptedObject().getParamType());
  Expect.equals(typeOf<Object>(), OptedObject<Object>().getParamType());

  Expect.equals(typeOf<Function>(), OptedFunction().getParamType());
  Expect.equals(typeOf<Function>(), OptedFunction<Function>().getParamType());
}
