/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

import "../../../Utils/expect.dart";

class OPTED_NULLABLE_ARGS {
  void test_int     (int? i     ) { Expect.isNull(i); }
  void test_object  (Object? o  ) { Expect.isNull(o); }
  void test_function(Function? f) { Expect.isNull(f); }
}

class OPTED_NONNULLABLE_ARGS {
  void test_int     (int i     ) { Expect.isNull(i); }
  void test_object  (Object o  ) { Expect.isNull(o); }
  void test_function(Function f) { Expect.isNull(f); }
}

void testme() {}

class OPTED_NULLABLE_FIELD {
  int?      i;
  Object?   o;
  Function? f;
}

class OPTED_NONNULLABLE_FIELD {
  int      i = 1;
  Object   o = 1;
  Function f = testme;
}

class OPTED_NULLABLE_GETTER {
  int?      get getInt      => null;
  Object?   get getObject   => null;
  Function? get getFunction => null;
}

class OPTED_NONNULLABLE_GETTER {
  int           get getInt         => 1;
  Object        get getObject      => 1;
  Function      get getFunction    => testme;
}

class OPTED_NULLABLE_SETTER {
  void set setInt     (int?      i) { Expect.isNull(i); }
  void set setObject  (Object?   o) { Expect.isNull(o); }
  void set setFunction(Function? f) { Expect.isNull(f); }
}

class OPTED_NONNULLABLE_SETTER {
  void set setInt      (int i     ) { Expect.isNull(i); }
  void set setObject   (Object o  ) { Expect.isNull(o); }
  void set setFunction (Function f) { Expect.isNull(f); }
}

class OPTED_NULLABLE_RETURN {
  int?      getInt()      => null;
  Object?   getObject()   => null;
  Function? getFunction() => null;
}

class OPTED_NONNULLABLE_RETURN {
  int      getInt()      => 1;
  Object   getObject()   => 1;
  Function getFunction() => testme;
}

class OPTED_NONNULLABLE_INT     <T extends int     > {}
class OPTED_NONNULLABLE_OBJECT  <T extends Object  > {}
class OPTED_NONNULLABLE_FUNCTION<T extends Function> {}

class OPTED_NULLABLE_INT     <T extends int?>      {}
class OPTED_NULLABLE_OBJECT  <T extends Object?>   {}
class OPTED_NULLABLE_FUNCTION<T extends Function?> {}
