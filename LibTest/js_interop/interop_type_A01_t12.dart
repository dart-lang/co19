// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When interacting with a JS value, you need to provide a Dart type
/// for it. You can do this by either using or declaring an interop type.
/// Interop types are either a "JS type" provided by Dart or an extension type
/// wrapping an interop type.
///
/// @description Check that a JS interop type member may contains in its
/// signature a type parameter that is a subtype of a JS primitive type.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type MyNumber<T extends JSNumber>._(JSObject _) implements JSObject {
  external MyNumber(T t);

  external T foo();
  external void bar(T _);
}

@JS("MyJSString")
extension type MyString<T extends JSString>._(JSObject _) implements JSObject {
  external MyString(T t);

  external T foo();
  external void bar(T _);
}

extension type MyBoolean<T extends JSBoolean>._(JSObject _) implements JSObject {
  external MyBoolean(T t);

  external T foo();
  external void bar(T _);
}

extension type MyBigInt<T extends JSBigInt>._(JSObject _) implements JSObject {
  external MyBigInt(T t);

  external T foo();
  external void bar(T _);
}

extension type MySymbol<T extends JSSymbol>._(JSObject _) implements JSObject {
  external MySymbol(T t);

  external T foo();
  external void bar(T _);
}

main() {
  eval(r'''
    class MyNumber {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        this.v = v;
      }
    }
    this.MyNumber = MyNumber;

    class MyJSString {
      constructor(v) {
        this.v = v;
      }
      
      foo() {
        return this.v;
      }
      bar(v) {
        this.v = v;
      }
    }
    this.MyJSString = MyJSString;

    class MyBoolean {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        this.v = v;
      }
    }
    this.MyBoolean = MyBoolean;

    class MyBigInt {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        this.v = v;
      }
    }
    this.MyBigInt = MyBigInt;
    this.mbi1 = 42n;
    this.mbi2 = 1n;

    class MySymbol {
      constructor(v) {
        this.v = v;
      }
      foo() {
        return this.v;
      }
      bar(v) {
        this.v = v;
      }
    }
    this.MySymbol = MySymbol;
    this.ms1 = Symbol("1");
    this.ms2 = Symbol("2");
  ''');
  var mn = MyNumber(1.toJS);
  Expect.equals(1, (mn.foo() as JSNumber).toDartInt);
  mn.bar(42.toJS);
  Expect.equals(42, (mn.foo() as JSNumber).toDartInt);

  var ms = MyString<JSString>("a".toJS);
  Expect.equals("a", (ms.foo() as JSString).toDart);
  ms.bar("b".toJS);
  Expect.equals("b", (ms.foo() as JSString).toDart);

  var mb = MyBoolean(true.toJS);
  Expect.equals(true, (mb.foo() as JSBoolean).toDart);
  mb.bar(false.toJS);
  Expect.equals(false, (mb.foo() as JSBoolean).toDart);

  var jsV1 = globalContext["mbi1"] as JSBigInt;
  var jsV2 = globalContext["mbi2"] as JSBigInt;
  var mbi = MyBigInt<JSBigInt>(jsV1);
  Expect.equals(jsV1.dartify(), (mbi.foo() as JSBigInt).dartify());
  mbi.bar(jsV2);
  Expect.equals(jsV2.dartify(), (mbi.foo() as JSBigInt).dartify());

  var jsS1 = globalContext["ms1"] as JSSymbol;
  var jsS2 = globalContext["ms2"] as JSSymbol;
  var msmb = MySymbol(jsS1);
  Expect.equals(jsS1.dartify(), (msmb.foo() as JSSymbol).dartify());
  msmb.bar(jsS2);
  Expect.equals(jsS2.dartify(), (msmb.foo() as JSSymbol).dartify());
}
