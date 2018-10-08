/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var select, doc1, doc2, str;

  select = document.createElement("select");
  var option = select.append(document.createElement("option"));
  option.id = "option";

  doc1 = document.implementation.createHtmlDocument('');
  doc2 = document.implementation.createHtmlDocument('');

  doc1.body.append(select);
  select.options[option];

  option.remove();
  option = null;

  step2()
  {
    select.remove();
    doc2.body.append(select);
    shouldBeNull(select.options[option]);
    asyncEnd();
  }

  asyncStart();
  setTimeout(step2, 100);
}
