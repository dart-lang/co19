/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
    <div id="x">
      <iframe src="IntentionallyMissingFile">
    </div>
  ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("x").innerHtml = "";

  var message = "<b>PASS:</b> body and iframe cleared without crashing.";
  body.innerHtml = message;

  Expect.equals(message, body.innerHtml); 
}

