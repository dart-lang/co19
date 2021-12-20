// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow explicit instantiation of tear-offs and type literals, by allowing type arguments where we would otherwise do implicit instantiation of tear-offs, or after type literals. Examples:
///
/// typedef ListList<T> = List<List<T>>;
/// T top<T>(T value) => value;
/// class C {
///   static T stat<T>(T value) => value;
///   T inst<T>(T value) => value;
///   void method() {
///     var f1 = stat<int>;
///     var f1TypeName = stat<int>.runtimeType.toString();
///     var f2 = inst<int>;
///     var f2TypeName = inst<int>.runtimeType.toString();
///     var f3 = this.inst<int>;
///     var f3TypeName = this.inst<int>.runtimeType.toString();
///   }
/// }
/// mixin M on C {
///   static T mstat<T>(T value) => value;
///   T minst<T>(T value) => value;
///   void mmethod() {
///     var f1 = mstat<int>;
///     var f1TypeName = mstat<int>.runtimeType.toString();
///     var f2 = minst<int>;
///     var f2TypeName = minst<int>.runtimeType.toString();
///     var f3 = this.minst<int>;
///     var f3TypeName = this.minst<int>.runtimeType.toString();
///   }
/// }
/// extension Ext on C {
///   static T estat<T>(T value) => value;
///   T einst<T>(T value) => value;
///   void emethod() {
///     var f1 = estat<int>; // works like (int $) => Ext.estat<int>($)
///     var f1TypeName = estat<int>.runtimeType.toString();
///     var f2 = einst<int>; // works like (int $) => Ext(this).einst<int>($)
///     var f2TypeName = einst<int>.runtimeType.toString();
///     var f3 = this.einst<int>; // works like (int $) => Ext(this).einst<int>($)
///     var f3TypeName = this.einst<int>.runtimeType.toString();
///   }
/// }
/// class D extends C with M {
///   void method() {
///     var f4 = super.inst<int>; // works like (int $) => super.inst<int>($)
///     var f4TypeName = super.inst<int>.runtimeType.toString();
///   }
/// }
/// void main() {
///   // Type literals.
///   var t1 = List<int>; // Type object for `List<int>`.
///   var t2 = ListList<int>; // Type object for `List<List<int>>`.
///
///   // Instantiated function tear-offs.
///   T local<T>(T value) => value;
///
///   const f1 = top<int>; // int Function(int), works like (int $) => top<int>($);
///   const f2 = C.stat<int>; // int Function(int), works like (int $) => C.stat<int>($);
///   var f3 = local<int>; // int Function(int), works like (int $) => local<int>($);
///   var d = D();
///   var f4 = d.inst<int>; // int Function(int), works like (int $) => c.inst<int>($);
///   var f5 = d.minst<int>; // int Function(int), works like (int $) => c.minst<int>($);
///   var f6 = d.einst<int>; // int Function(int), works like (int $) => Ext(c).einst<int>($);
///
///   var typeName = List<int>.toString();
///   var functionTypeName = local<int>.runtimeType.toString();
/// }
///
/// @description Checks an example from the specification
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef int Func(int i);

class C {
  static T stat<T>(T value) => value;
  T inst<T>(T value) => value;
}

extension Ext on C {
  static T estat<T>(T value) => value;

  T einst<T>(T value) => value;

  void emethod() {
    var f1 = estat<int>;
    Expect.equals(42, f1(42));
    Expect.isTrue(f1 is Func);
    checkType(checkIs<Func>, true, f1);

    var f1TypeName = estat<int>.runtimeType.toString();
    Expect.equals(Func.toString(), f1TypeName);

    var f2 = einst<int>;
    Expect.equals(42, f2(42));
    Expect.isTrue(f2 is Func);
    checkType(checkIs<Func>, true, f2);

    var f2TypeName = einst<int>.runtimeType.toString();
    Expect.equals(Func.toString(), f2TypeName);

    var f3 = this.einst<int>;
    Expect.equals(42, f3(42));
    Expect.isTrue(f3 is Func);
    checkType(checkIs<Func>, true, f3);
    var f3TypeName = this.einst<int>.runtimeType.toString();
    Expect.equals(Func.toString(), f3TypeName);
  }
}

void main() {
  C c = new C();
  c.emethod();
  var f6 = c.einst<int>; // int Function(int), works like (int $) => Ext(c).einst<int>($);
  Expect.equals(42, f6(42));
  Expect.isTrue(f6 is Func);
  checkType(checkIs<Func>, true, f6);
}
