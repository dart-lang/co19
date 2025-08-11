// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `external` interop methods can only contain positional and
/// optional arguments. This is because JS members only take positional
/// arguments. The one exception is object literal constructors, where they can
/// contain only named arguments.
///
/// Unlike with non-external methods, optional arguments don't get replaced with
/// their default value, but are instead omitted.
///
/// @description Check that  default values of optional positioned parameters
/// are omitted.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import '../../Utils/expect.dart';
import 'js_utils.dart';

extension type ET._(JSObject _) implements JSObject {
  external ET(int id, String? name);

  external int? get id;
  external String? get name;
  external void update([int id = 0, String? name = "default"]);
}

@JS("ET")
extension type ET2._(JSObject _) implements JSObject {
  external factory ET2(int id, String? name);

  external int? get id;
  external String? get name;
  @JS("update")
  external void doUpdate([int id = 0, String? name = "default"]);
}

main() {
  eval(r'''
    class ET {
      constructor(id, name) {
        this._id = id;
        this._name = name;
      }
      get id() {
        return this._id;
      }
      get name() {
        return this._name;
      }
      set name(v) {
        return this._name = v;
      }
      update(id, name) {
        this._id = id;
        this._name = name;
      }
    }
    globalThis.ET = ET;
  ''');
  ET et1 = ET(1, "one");
  et1.update();
  Expect.isNull(et1.id);
  Expect.isNull(et1.name);
  et1.update(2);
  Expect.equals(2, et1.id);
  Expect.isNull(et1.name);
  et1.update(3, "New name");
  Expect.equals(3, et1.id);
  Expect.equals("New name", et1.name);

  ET2 et2 = ET2(2, "three");
  et2.doUpdate();
  Expect.isNull(et2.id);
  Expect.isNull(et2.name);
  et2.doUpdate(3);
  Expect.equals(3, et2.id);
  Expect.isNull(et2.name);
  et2.doUpdate(4, "New name");
  Expect.equals(4, et2.id);
  Expect.equals("New name", et2.name);
}
