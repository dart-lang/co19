// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isA<T extends JSAny?>()
/// Whether this [JSAny?] is an instance of the JavaScript type that is declared
/// by `T`.
/// ...
/// To determine the JavaScript constructor to use as the second operand in the
/// `instanceof` check, this function uses the JavaScript name associated with
/// the extension type, which is either the argument given to the @JS annotation
/// or the Dart declaration name. So, if you had an interop extension type
/// `JSClass` that wraps [JSArray] without a rename, this does an
/// `instanceOfString('JSClass')` check and not an `instanceOfString('Array')`
/// check.
///
/// There are two exceptions to this rule. The first exception is [JSTypedArray].
/// As `TypedArray` does not exist as a property in JavaScript, this does some
/// prototype checking to make `isA<JSTypedArray>` do the right thing. The other
/// exception is [JSAny]. If you do a `isA<JSAny>` check, it will only do a
/// `null` check.
///
/// @description Checks that `isA<JSTypedArray>` returns `true` for a
/// `JSTypedArray`.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../../Utils/expect.dart';

main() {
  test(JSFloat32Array());
  test(JSFloat64Array());
  test(JSInt16Array());
  test(JSInt32Array());
  test(JSInt8Array());
  test(JSUint16Array());
  test(JSUint32Array());
  test(JSUint8Array());
  test(JSUint8ClampedArray());
}

test(JSTypedArray ar) {
  Expect.isFalse(ar.isA<JSArray>());
  Expect.isTrue(ar.isA<JSTypedArray>());
}
