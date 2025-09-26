// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSArray<T> get toJSProxyOrRef
/// Converts this [List] to a [JSArray] by either casting, unwrapping, or
/// proxying the [List].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, the core [List] is a JavaScript `Array`, and
/// therefore this getter simply casts. If the [List] is not a core [List]
/// e.g. a user-defined list, this getter throws with a cast error.
///
/// When compiling to Wasm, this [List] is a wrapper around an `Array` if it
/// was converted via [JSArrayToList.toDart]. If it's a wrapper, this getter
/// unwraps it and returns the `Array`. If it's instantiated in Dart, this
/// getter proxies the [List] using a heavyweight `Array` wrapper. Access to
/// the original [List]'s elements may be very unperformant.
///
/// Modifications to this [List] will affect the returned [JSArray] and vice
/// versa.
///
/// @description Check that this is a run-time error to call `toJS` on a custom
/// list on `dart2js`.
/// @author sgrekhov22@gmail.com
/// @issue 61327

import 'dart:collection';
import 'dart:js_interop';

import '../../../Utils/expect.dart';

class MyList<E> extends ListBase<E> {
  List<E> _data;

  MyList.from(Iterable elements): _data = List.from(elements);

  @override
  int get length => _data.length;

  @override
  void set length(int newLength) {
    _data.length = newLength;
  }

  @override
  E operator [](int index) => _data[index];

  @override
  void operator []=(int index, value) {
    _data[index] = value;
  }
}

main() {
  MyList<JSNumber> l = MyList.from([1.toJS, 2.toJS, 3.toJS]);
  if (isJS) {
    Expect.throws(() {
      JSArray<JSNumber> a = l.toJSProxyOrRef;
    });
  }
  if (isWasm) {
    JSArray<JSNumber> a = l.toJSProxyOrRef;
    Expect.listEquals(l, a.toDart);
  }
}
