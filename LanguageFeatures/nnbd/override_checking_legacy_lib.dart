/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// @dart=2.4
// SharedOptions=--enable-experiment=non-nullable

library override_legacy_lib;

import "dart:async";
import "../../Utils/expect.dart";

class LEGACY_ARGS {
  void test_int(int i)           { Expect.fail("This method should be overriden"); }
  void test_object(Object o)     { Expect.fail("This method should be overriden"); }
  void test_dynamic(dynamic i)   { Expect.fail("This method should be overriden"); }
  void test_function(Function f) { Expect.fail("This method should be overriden"); }
  void test_null(Null n)         { Expect.fail("This method should be overriden"); }
  void test_futureOr(FutureOr i) { Expect.fail("This method should be overriden"); }
}

class LEGACY_REQUIRED_ARGS {
  void test_default({int i = 1}) { Expect.fail("This method should be overriden"); }
  void test_nondefault({int i})  { Expect.fail("This method should be overriden"); }
}

class LEGACY_FIELD {
  int i;
  Object o;
  dynamic d;
  Function func;
  Null n;
  FutureOr f;
  FutureOr<int> fi;
  FutureOr<Function> ff;
  void v;
}

class LEGACY_GETTER {
  int get getInt {
    Expect.fail("This method should be overriden");
    return -1;
  }

  Object get getObject {
    Expect.fail("This method should be overriden");
    return -1;
  }

  dynamic get getDynamic {
    Expect.fail("This method should be overriden");
    return -1;
  }

  Function get getFunction {
    Expect.fail("This method should be overriden");
    return null;
  }

  Null get getNull {
    Expect.fail("This method should be overriden");
    return null;
  }

  FutureOr get getFutureOr {
    Expect.fail("This method should be overriden");
    return -1;
  }

  FutureOr<int> get getFutureOrInt {
    Expect.fail("This method should be overriden");
    return -1;
  }

  FutureOr<Function> get getFutureOrFunction {
    Expect.fail("This method should be overriden");
    return null;
  }
}

class LEGACY_SETTER {
  void set setInt(int i)                             { Expect.fail("This method should be overriden"); }
  void set setObject(Object o)                       { Expect.fail("This method should be overriden"); }
  void set setDynamic(dynamic d)                     { Expect.fail("This method should be overriden"); }
  void set setNull(Null n)                           { Expect.fail("This method should be overriden"); }
  void set setFunction(Function f)                   { Expect.fail("This method should be overriden"); }
  void set setFutureOr(FutureOr f)                   { Expect.fail("This method should be overriden"); }
  void set setFutureOrInt(FutureOr<int> i)           { Expect.fail("This method should be overriden"); }
  void set setFutureOrFunction(FutureOr<Function> f) { Expect.fail("This method should be overriden"); }
}

class LEGACY_RETURN {
  int getInt() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  Object getObject() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  dynamic getDynamic() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  Function getFunction() {
    Expect.fail("This method should be overriden");
    return null;
  }

  Null getNull() {
    Expect.fail("This method should be overriden");
    return null;
  }

  FutureOr getFutureOr() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  FutureOr<int> getFutureOrInt() {
    Expect.fail("This method should be overriden");
    return -1;
  }

  FutureOr<Function> getFutureOrFunction() {
    Expect.fail("This method should be overriden");
    return null;
  }
}

class A {}
class D<X extends A> {}
