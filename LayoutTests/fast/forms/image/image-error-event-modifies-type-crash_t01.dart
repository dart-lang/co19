/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test Passes if it does not crash.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input>
        <input id="imageInput" type="image" src="http://127.0.0.1/IntentionallyMissingFile.html" />
      </input>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement inputNode = document.getElementById('imageInput') as InputElement;

  void eventhandler(_) {
    inputNode.type = "";
    setTimeout(asyncEnd, 10);
  }

  asyncStart();
  inputNode.onError.listen(eventhandler);
}
