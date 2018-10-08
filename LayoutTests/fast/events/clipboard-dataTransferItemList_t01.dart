/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests copy / paste and DataTransferItemList
 */
import "dart:html";
import "dart:convert";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div>Copy handler: <select id="copyMethod"><option>Legacy</option><option>DataTransferItemList</option></select></div>
      <div>Paste handler: <select id="pasteMethod"><option>Legacy</option><option>DataTransferItemList</option></select></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var testDataTransfer;
  var runNext;

  legacyCopyStart(dataTransfer)
  {
    testDataTransfer = dataTransfer;
    dataTransfer.setData('text', 'sample');
    dataTransfer.setData('url', 'http://www.google.com/');
    dataTransfer.setData('text/html', '<em>Markup</em>');
    dataTransfer.setData('custom-data', 'hello world');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), 'hello world');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), 'hello world');
  }

  itemListCopyStart(dataTransfer)
  {
    testDataTransfer = dataTransfer;
    //shouldBeUndefined(testDataTransfer.items.item);
    dataTransfer.items.add('sample', 'text/plain');
    dataTransfer.items.add('http://www.google.com/', 'text/uri-list');
    dataTransfer.items.add('<em>Markup</em>', 'text/html');
    dataTransfer.items.add('hello world', 'custom-data');
  }

  copy(event)
  {
    event.preventDefault();
    SelectElement copyMethod = document.getElementById('copyMethod');
    if (copyMethod.selectedIndex == 0)
      legacyCopyStart(event.clipboardData);
    else if (copyMethod.selectedIndex == 1)
      itemListCopyStart(event.clipboardData);
  }

  legacyPaste(dataTransfer)
  {
    testDataTransfer = dataTransfer;
    shouldBe(testDataTransfer.types.length, 4);
    shouldBeTrue(testDataTransfer.types.indexOf("text/plain") >= 0);
    shouldBeTrue(testDataTransfer.types.indexOf("text/uri-list") >= 0);
    shouldBeTrue(testDataTransfer.types.indexOf("text/html") >= 0);
    shouldBeTrue(testDataTransfer.types.indexOf("custom-data") >= 0);
    shouldBeEqualToString(testDataTransfer.getData("text"), 'sample');
    shouldBeEqualToString(testDataTransfer.getData("url"), 'http://www.google.com/');
    shouldBeEqualToString(testDataTransfer.getData("text/html"), '<em>Markup</em>');
    shouldBeEqualToString(testDataTransfer.getData("custom-data"), 'hello world');
    setTimeout(runNext, 0);
  }

  var testData, expectedTestData;
  var types, expectedTypes;
  var outstandingRequests;
  itemListPaste(dataTransfer)
  {
    testDataTransfer = dataTransfer;
    outstandingRequests = 0;
    shouldBe(testDataTransfer.items.length, 4);
    types = [];
    for (var i = 0; i < dataTransfer.items.length; ++i) {
      types.add({'kind': dataTransfer.items[i].kind, 'type': dataTransfer.items[i].type});
    }
    //types.sort((a, b) { return a.type.localeCompare(b.type); });
    types.sort((a,b) => a['type'].compareTo(b['type']));
    expectedTypes = [
    { 'kind': 'string', 'type': 'custom-data'},
    { 'kind': 'string', 'type': 'text/html'},
    { 'kind': 'string', 'type': 'text/plain'},
    { 'kind': 'string', 'type': 'text/uri-list'},
    ];
    stringify(x) => new JsonEncoder().convert(x);
    shouldBe(stringify(expectedTypes), stringify(types));
    var expectedResults = {
      'custom-data': 'hello world',
      'text/html': '<em>Markup</em>',
      'text/plain': 'sample',
      'text/uri-list': 'http://www.google.com/',
    };
    makeClosure(expectedData)
    {
      ++outstandingRequests;
      return (data) {
        expectedTestData = expectedData;
        testData = data;
        shouldBe(testData, expectedTestData);
        if (--outstandingRequests == 0)
          setTimeout(runNext, 0);
      };
    }
    // We use this funky loop to make sure we always print out results in the same order.
    for (var i = 0; i < types.length; ++i) {
      for (var j = 0; j < dataTransfer.items.length; ++j) {
        if (types[i]['type'] == dataTransfer.items[j].type) {
          dataTransfer.items[j].getAsString().then(makeClosure(expectedResults[types[i]['type']]));
          break;
        }
      }
    }
  }

  paste(event)
  {
    SelectElement pasteMethod= document.getElementById('pasteMethod');
    if (pasteMethod.selectedIndex == 0)
      legacyPaste(event.clipboardData);
    else if (pasteMethod.selectedIndex == 1)
      itemListPaste(event.clipboardData);
  }

  runTest(copyMethodIndex, pasteMethodIndex)
  {
    SelectElement copyMethod = document.getElementById('copyMethod');
    SelectElement pasteMethod = document.getElementById('pasteMethod');
    copyMethod.selectedIndex = copyMethodIndex;
    pasteMethod.selectedIndex = pasteMethodIndex;
    debug('Running test with ' + copyMethod.value + ' copy handler and ' + pasteMethod.value + ' paste handler');

    document.execCommand('copy', false, '');
    document.execCommand('paste', false, '');
  }

  var testCases = [
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1],
    ];

  runNext = () {
    if (testCases.isEmpty) {
      asyncEnd();
    } else {
      var testCase = testCases.removeAt(0);
      runTest(testCase[0], testCase[1]);
    }
  };

  document.body.onCopy.listen(copy);
  document.body.onPaste.listen(paste);

  asyncStart();
  runNext();
}
