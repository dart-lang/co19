/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable

library override_legacy_lib;

import "dart:async";
import "../../../Utils/expect.dart";

class LEGACY_ARGS {
  void test_int     (int i     ) { Expect.fail("This method should be overriden"); }
  void test_object  (Object o  ) { Expect.fail("This method should be overriden"); }
  void test_dynamic (dynamic i ) { Expect.fail("This method should be overriden"); }
  void test_function(Function f) { Expect.fail("This method should be overriden"); }
  void test_null    (Null n    ) { Expect.fail("This method should be overriden"); }
  void test_futureOr(FutureOr i) { Expect.fail("This method should be overriden"); }
}

class LEGACY_REQUIRED_ARGS {
  void test_default   ({int i = 1}) { Expect.fail("This method should be overriden"); }
  void test_nondefault({int i    }) { Expect.fail("This method should be overriden"); }
}

class LEGACY_FIELD {
  int                i;
  Object             o;
  dynamic            d;
  Function           func;
  Null               n;
  FutureOr           f;
  FutureOr<int>      fi;
  FutureOr<Function> ff;
  void               v;
}

class LEGACY_GETTER {
  int                get getInt              => throw("This method should be overriden");
  Object             get getObject           => throw("This method should be overriden");
  dynamic            get getDynamic          => throw("This method should be overriden");
  Function           get getFunction         => throw("This method should be overriden");
  Null               get getNull             => throw("This method should be overriden");
  FutureOr           get getFutureOr         => throw("This method should be overriden");
  FutureOr<int>      get getFutureOrInt      => throw("This method should be overriden");
  FutureOr<Function> get getFutureOrFunction => throw("This method should be overriden");
}

class LEGACY_SETTER {
  void set setInt             (int                i) { Expect.fail("This method should be overriden"); }
  void set setObject          (Object             o) { Expect.fail("This method should be overriden"); }
  void set setDynamic         (dynamic            d) { Expect.fail("This method should be overriden"); }
  void set setNull            (Null               n) { Expect.fail("This method should be overriden"); }
  void set setFunction        (Function           f) { Expect.fail("This method should be overriden"); }
  void set setFutureOr        (FutureOr           f) { Expect.fail("This method should be overriden"); }
  void set setFutureOrInt     (FutureOr<int>      i) { Expect.fail("This method should be overriden"); }
  void set setFutureOrFunction(FutureOr<Function> f) { Expect.fail("This method should be overriden"); }
}

class LEGACY_RETURN {
  int                getInt()              => throw("This method should be overriden");
  Object             getObject()           => throw("This method should be overriden");
  dynamic            getDynamic()          => throw("This method should be overriden");
  Function           getFunction()         => throw("This method should be overriden");
  Null               getNull()             => throw("This method should be overriden");
  FutureOr           getFutureOr()         => throw("This method should be overriden");
  FutureOr<int>      getFutureOrInt()      => throw("This method should be overriden");
  FutureOr<Function> getFutureOrFunction() => throw("This method should be overriden");
}

class LEGACY_CLASS         <T extends dynamic > {}
class LEGACY_CLASS_INT     <T extends int     > {}
class LEGACY_CLASS_OBJECT  <T extends Object  > {}
class LEGACY_CLASS_FUNCTION<T extends Function> {}
class LEGACY_CLASS_NULL    <T extends Null    > {}
