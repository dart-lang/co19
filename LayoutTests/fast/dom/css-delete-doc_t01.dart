/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var iteration = 0;
  var sheet, rules;
  var step1, step2a, step2b;

  step1 = ([opt_media=false])
  {
    var doc = document.implementation.createHtmlDocument('');
    StyleElement style = doc.createElement('style');
    doc.head.append(style);
    sheet = style.sheet;
    if (opt_media) {
      sheet.insertRule(
          '@media screen { body { background: red; } p { color: white; } }', 0);
      rules = sheet.rules[0];
      sheet.removeRule(0);
      sheet = 0;
    }

    style.remove();
    document.adoptNode(style);
    //delete doc;
    doc = null;
    gc();
    setTimeout(opt_media? step2a : step2b, 10);
  };

  step2a = ()
  {
    try {
      rules.insertRule('a { }', 1);
      if (iteration++ == 10) {
        iteration = 0;
        step1(true);
        return;
      }

      setTimeout(() => step1(false), 0);
    }
    catch(e) {
      testFailed('FAIL, threw exception.');
    }    
  };

  step2b = ()
  {
    try {
      sheet.insertRule('a { }', 0);
      if (iteration++ == 10) {
        asyncEnd();
        return;
      }

      setTimeout(() => step1(true), 0);
    }
    catch(e) {
      testFailed('FAIL, threw exception.');
    }
  };

  asyncStart();
  step1();
}
