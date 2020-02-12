/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

library override_opted_in_lib;

import "dart:async";
import "../../../Utils/expect.dart";

class OPTED_NULLABLE_ARGS {
  void test_int     (int? i     ) { Expect.fail("This method should be overriden"); }
  void test_object  (Object? o  ) { Expect.fail("This method should be overriden"); }
  void test_dynamic (dynamic i  ) { Expect.fail("This method should be overriden"); }
  void test_function(Function? f) { Expect.fail("This method should be overriden"); }
  void test_null    (Null n     ) { Expect.fail("This method should be overriden"); }
  void test_futureOr(FutureOr i ) { Expect.fail("This method should be overriden"); }
}

class OPTED_NONNULLABLE_ARGS {
  void test_int     (int i          ) { Expect.fail("This method should be overriden"); }
  void test_object  (Object o       ) { Expect.fail("This method should be overriden"); }
  void test_function(Function f     ) { Expect.fail("This method should be overriden"); }
  void test_futureOr(FutureOr<int> i) { Expect.fail("This method should be overriden"); }
}

class OPTED_NEVER_ARGS {
  void test_never(Never n) { Expect.fail("This method should be overriden"); }
}

class OPTED_REQUIRED_ARGS {
  void test_required_nonnullable({required int i})  { Expect.fail("This method should be overriden"); }
  void test_required_nullable   ({required int? i}) { Expect.fail("This method should be overriden"); }
}

class OPTED_NULLABLE_FIELD {
  int?      i;
  Object?   o;
  dynamic   d;
  Function? f;
  Null      n;
  FutureOr  fo;
  void      v;
}

void testme() {}

class OPTED_NONNULLABLE_FIELD {
  int           i  = 0;
  Object        o  = 0;
  Function      f  = testme;
  FutureOr<int> fi = 0;
}

class OPTED_NEVER_FIELD {
  Never n = throw "Cannot reach here";
}

class OPTED_NULLABLE_GETTER {
  int?      get getInt      => throw("This method should be overriden");
  Object?   get getObject   => throw("This method should be overriden");
  dynamic   get getDynamic  => throw("This method should be overriden");
  Function? get getFunction => throw("This method should be overriden");
  Null      get getNull     => throw("This method should be overriden");
  FutureOr  get getFutureOr => throw("This method should be overriden");
}

class OPTED_NONNULLABLE_GETTER {
  int           get getInt         => throw("This method should be overriden");
  Object        get getObject      => throw("This method should be overriden");
  Function      get getFunction    => throw("This method should be overriden");
  FutureOr<int> get getFutureOrInt => throw("This method should be overriden");
}

class OPTED_NEVER_GETTER {
  Never get getNever => throw("This method should be overriden");
}

class OPTED_NULLABLE_SETTER {
  void set setInt     (int?      i) { Expect.fail("This method should be overriden"); }
  void set setObject  (Object?   o) { Expect.fail("This method should be overriden"); }
  void set setDynamic (dynamic   d) { Expect.fail("This method should be overriden"); }
  void set setFunction(Function? f) { Expect.fail("This method should be overriden"); }
  void set setNull    (Null      n) { Expect.fail("This method should be overriden"); }
  void set setFutureOr(FutureOr  f) { Expect.fail("This method should be overriden"); }
}

class OPTED_NONNULLABLE_SETTER {
  void set setInt        (int i          ) { Expect.fail("This method should be overriden"); }
  void set setObject     (Object o       ) { Expect.fail("This method should be overriden"); }
  void set setFunction   (Function f     ) { Expect.fail("This method should be overriden"); }
  void set setFutureOrInt(FutureOr<int> i) { Expect.fail("This method should be overriden"); }
}

class OPTED_NEVER_SETTER {
  void set setNever(Never n) { Expect.fail("This method should be overriden"); }
}

class OPTED_NULLABLE_RETURN {
  int?      getInt()      => throw("This method should be overriden");
  Object?   getObject()   => throw("This method should be overriden");
  dynamic   getDynamic()  => throw("This method should be overriden");
  Function? getFunction() => throw("This method should be overriden");
  Null      getNull()     => throw("This method should be overriden");
  FutureOr  getFutureOr() => throw("This method should be overriden");
}

class OPTED_NONNULLABLE_RETURN {
  int           getInt()         => throw("This method should be overriden");
  Object        getObject()      => throw("This method should be overriden");
  Function      getFunction()    => throw("This method should be overriden");
  FutureOr<int> getFutureOrInt() => throw("This method should be overriden");
}

class OPTED_NEVER_RETURN {
  Never getNever() => throw("This method should be overriden");
}

class OPTED_NONNULLABLE_INT     <T extends int     > {}
class OPTED_NONNULLABLE_OBJECT  <T extends Object  > {}
class OPTED_NONNULLABLE_FUNCTION<T extends Function> {}

class OPTED_NULLABLE         <T>                   {}
class OPTED_DYNAMIC          <T extends dynamic>   {}
class OPTED_NULLABLE_INT     <T extends int?>      {}
class OPTED_NULLABLE_OBJECT  <T extends Object?>   {}
class OPTED_NULLABLE_FUNCTION<T extends Function?> {}
class OPTED_NULL             <T extends Null>      {}

class OPTED_NEVER<T extends Never> {}
