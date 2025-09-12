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
/// > When compiling to JavaScript, all typed lists are the equivalent
/// > JavaScript typed arrays, and therefore this method simply casts.
/// > When compiling to Wasm, this [ByteData] may or may not be a wrapper
/// > depending on if it was converted from JavaScript or instantiated in
/// > Dart. If it's a wrapper, this method unwraps it. If it's instantiated in
/// > Dart, this method clones this [ByteData]'s values into a new
/// > [JSDataView].
/// > Avoid assuming that modifications to this [ByteData] will affect the
/// > [JSDataView] and vice versa unless it was instantiated in JavaScript.
///
/// @description Check that on `dart2wasm` if [ByteBuffer] was instantiated in
/// JavaScript then this operations unwraps it and therefore changes in the
/// original object affect the one returned by this operation.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:typed_data';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    globalThis.buffer = new ArrayBuffer(2);
    globalThis.dv = new DataView(buffer);
    globalThis.dv.setInt16(0, 42);
  ''');
  ByteData bd = (globalContext["dv"] as JSDataView).toDart;
  Expect.equals(42, bd.getInt16(0));

  JSDataView dv = bd.toJS;
  globalContext["dv"] = dv;
  eval("globalThis.dv.setInt16(0, 333);");
  Expect.equals(333, bd.getInt16(0));
}
