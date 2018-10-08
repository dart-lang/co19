/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Inserting a form control with a form attribute into a
 * non-document tree should not cause it to get a form owner.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <form id=myform></form>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input = document.createElement('input') as InputElement;
  input.setAttribute('form', 'myform');
  shouldBeNull(input.form);

  DivElement div = document.createElement('div') as DivElement;
  div.append(input);
  shouldBeNull(input.form);
}
