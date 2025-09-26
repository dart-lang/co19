// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSDataView get toJS
/// Converts this [ByteData] to a [JSDataView] by either casting, unwrapping,
/// or cloning the [ByteData].
///
/// > [!NOTE]
/// > Depending on whether code is compiled to JavaScript or Wasm, this
/// > conversion will have different semantics.
///
/// When compiling to JavaScript, all typed lists are the equivalent
/// JavaScript typed arrays, and therefore this getter simply casts.
///
/// When compiling to Wasm, this [ByteData] is a wrapper around a `DataView`
/// if it was converted via [JSDataViewToByteData.toDart]. If it is a wrapper,
/// this getter unwraps it and returns the `DataView`. If it's instantiated in
/// Dart, this getter clones this [ByteData]'s values into a new [JSDataView].
///
/// Avoid assuming that modifications to this [ByteData] will affect the
/// returned [JSDataView] and vice versa on all compilers unless it was first
/// converted via [JSDataViewToByteData.toDart].
///
/// @description Check that on `dart2wasm` if [ByteData] was instantiated in
/// Dart then this operation clones. Hence, changes in the original object not
/// affect the cloned one.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  var bd = ByteData(2);
  bd.setInt16(0, 42);
  JSDataView dv = bd.toJS;
  globalContext["dv"] = dv;
  eval("globalThis.dv.setInt16(0, 333);");
  if (isWasm) {
    Expect.equals(42, bd.getInt16(0));
  }
  if (isJS) {
    // In case of JS `toJS` just casts and therefore this is the same object
    Expect.equals(333, bd.getInt16(0));
  }
}
