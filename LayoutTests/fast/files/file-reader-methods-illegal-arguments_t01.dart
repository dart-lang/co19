/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test FileReader methods and their argument type checking.
 */
import "dart:html";
import "dart:typed_data";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var blob = new Blob(["aa"]);
  var fileReader;
  var method;

  selectFunc(obj, name) {
    switch (name) {
      case "readAsArrayBuffer": return obj.readAsArrayBuffer;
      case "readAsText": return obj.readAsText;
      case "readAsDataUrl": return obj.readAsDataUrl;
    }
  }

  testReadMethod(name)
  {
    fileReader = new FileReader();
    var func = selectFunc(fileReader, name);
    debug("$name()");
    shouldThrow(() => func());
    debug("$name(2)");
    shouldThrow(() => func(2));
    //debug("$name(null)");
    //shouldThrow(() => func(null));
    debug("$name(fileReader)");
    shouldThrow(() => func(fileReader));
    debug("$name([])");
    shouldThrow(() => func([]));
    if (name == "readAsText") {
      debug("$name(blob, 'utf-8')");
      shouldNotThrow(() => func(blob, 'utf-8'));
      debug("$name(blob)");
      shouldThrow(() => func(blob)); // The object is already busy reading Blobs
    }
  }

  var methods = [ "readAsArrayBuffer", "readAsText", "readAsDataUrl" ];

  methods.forEach((m) { testReadMethod(m); });
}
