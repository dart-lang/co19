/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var div = document.createElement('div');
  div.append(document.body.parent);
  var a = document.createElement('a');
  a.innerHtml = '<x><html></html>'; 

  document.append(document.createElement('html'));
  document.documentElement.innerHtml =
    '<div>This tests that we won\'t crash when creating a new html element when the document does not ' +
    'have a document element.</div><div>SUCCESS - Did not crash!</div>';
}
