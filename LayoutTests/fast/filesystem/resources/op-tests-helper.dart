library op_tests_helper;

import "dart:html";
import "../../../testcommon.dart";
import "fs-test-util.dart";

toString(obj) {
  if (obj is Map)
    return obj.toString();
  else if (obj is Iterable)
    return obj.map(toString).toList().toString();
  else
    return 'ENTRY {path: ${obj.fullPath} name: ${obj.name} type: ${obj.isDirectory ? "directory" : "file"}}';
}

// Creates a test environment for the given entries where entries is an array
// of {fullPath:String, isDirectory:boolean} object.  When the world is created
// successfully, successCallback is called with an object that holds all the
// created entry objects.

class CreateHelper {
  var fileSystem, entries, successCallback, errorCallback;
  var current = 0;
  var environment = {};

  CreateHelper(this.fileSystem, this.entries, this.successCallback, this.errorCallback);

  createSuccessCallback([size]) => (entry) {
    if (size == null)
      size = 0;
    if (entry.isFile && size > 0) {
      entry.createWriter().then((writer) {
        writer.truncate(size);
        writer.onError.listen(createErrorCallback(entry));
        writer.onWriteEnd.listen((_) {
          environment[entry.fullPath] = entry;
          environment[entry.fullPath + '.size'] = size;
          createNextEntry();
        });
      }, onError: createErrorCallback(entry));
    } else {
      environment[entry.fullPath] = entry;
      environment[entry.fullPath + '.size'] = 0;
      createNextEntry();
    }
  };
  createErrorCallback([entry]) => (error) {
    if (entry != null) {
      debug('Got unexpected error ${error.name} while creating ' + toString(entry));
      errorCallback(error);
    } else {
      errorCallback(error);
    }
  };
  createNextEntry() {
    if (current >= entries.length) {
      successCallback(environment);
      return;
    }
    var entry = entries[current++];
    if (entry['isDirectory']) {
      fileSystem.root.createDirectory(entry['fullPath'])
        .then(createSuccessCallback(), onError: createErrorCallback(entry));
    }
    else
      fileSystem.root.createFile(entry['fullPath'])
        .then(createSuccessCallback(entry['size']), onError: createErrorCallback());
  }
}

createTestEnvironment(fileSystem, entries, successCallback, errorCallback)
{
  if (entries == null || entries.length == 0) {
    successCallback({});
    return;
  }
  var helper = new CreateHelper(fileSystem, entries, successCallback, errorCallback);
  helper.createNextEntry();
}

class VerifyHelper {
  var fileSystem, entries, successCallback, errorCallback;
  var current = 0;
  var expectedNonexistent = false;

  VerifyHelper(this.fileSystem, this.entries, this.successCallback, this.errorCallback);

  verifySuccessCallback(entry) {
    if (expectedNonexistent) {
      testFailed('Found unexpected entry ${entry.fullPath}');
      //errorCallback();
    } else { 
      testPassed('Verified entry: ${toString(entry)}');
      verifyNextEntry();
    }
  }
  verifyErrorCallback(entry) => (error) {
    if (expectedNonexistent) {
      testPassed('Verified entry does NOT exist: ${entry["fullPath"]}');
      verifyNextEntry();
      return;
    }
    else
      testFailed('Got unexpected error ${error.name} for ${entry["fullPath"]}');
    //errorCallback(error);
  };
  verifyNextEntry() {
    if (current >= entries.length) {
      successCallback();
      return;
    }
    var entry = entries[current++];
    expectedNonexistent = entry.containsKey('nonexistent') && entry['nonexistent'];
    if (entry['isDirectory'])
      fileSystem.root.getDirectory(entry['fullPath'])
        .then(verifySuccessCallback, onError: verifyErrorCallback(entry));
    else
      fileSystem.root.getFile(entry['fullPath'])
        .then(verifySuccessCallback, onError: verifyErrorCallback(entry));
  }
}

verifyTestEnvironment(fileSystem, entries, successCallback, errorCallback)
{
  if (entries == null || entries.length == 0) {
    successCallback();
    return;
  }
  var helper = new VerifyHelper(fileSystem, entries, successCallback, errorCallback);
  helper.verifyNextEntry();
}

// testCase must have precondition, postcondition and test  field.

class OperationTestHelper {
  var fileSystem, testCase, successCallback, errorCallback;
  var stage = '';
  var environment = {};
  var currentTest = 0;
  var currentReader = null;
  var readEntries = [];
  var entry = null;
  var expectedError = null;
  var roundedStartDate = null;

  OperationTestHelper(this.fileSystem, this.testCase, this.successCallback, this.errorCallback);

  getSymbolString(symbol) {
    return environment[symbol];
  }
  testSuccessCallback(_) {
    if (expectedError == null) {
      testPassed('Succeeded: ' + stage);
      runNextTest();
    } else
      testFailed('Unexpectedly succeeded while ' + stage);
  }
  testGetSuccessCallback(entry) {
    if (expectedError == null) {
      testPassed('Succeeded: ' + stage);
      this.entry = entry;
      shouldBe(environment[entry.fullPath].fullPath, entry.fullPath);
      shouldBe(environment[entry.fullPath].isFile, entry.isFile);
      shouldBe(environment[entry.fullPath].isDirectory, entry.isDirectory);
      runNextTest();
    } else
      testFailed('Unexpectedly succeeded while ' + stage);
  }
  testCreateSuccessCallback(entry) {
    if (expectedError == null) {
      testPassed('Succeeded: ' + stage);
      environment[entry.fullPath] = entry;
      runNextTest();
    } else
      testFailed('Unexpectedly succeeded while ' + stage);
  }
  testGetParentSuccessCallback(entry) {
    if (expectedError == null) {
      testPassed('Succeeded: ' + stage);
      debug('Parent entry: ' + toString(entry));
      runNextTest();
    } else
      testFailed('Unexpectedly succeeded while ' + stage);
  }
  testReadEntriesSuccessCallback(entries) {
    if (expectedError != null)
      testFailed('Unexpectedly succeeded while ' + stage);

    readEntries.addAll(entries);

    if (entries.length > 0) {
      currentReader.readEntries().then(testReadEntriesSuccessCallback,
          onError: testErrorCallback);
      return;
    }

    testPassed('Succeeded: ' + stage);
    debug('Entries: ' + toString(readEntries));
    runNextTest();
  }
  testMetadataSuccessCallback(/*String*/entry) => (metadata) {
    if (expectedError == null) {
      testPassed('Succeeded: ' + stage);
      var symbol = entry + '.returned.modificationTime';
      environment[symbol] = metadata.modificationTime;
      var entryMetadataString = getSymbolString(symbol);
      if (entry != '/') {
        shouldBeGreaterThanOrEqual(entryMetadataString.millisecondsSinceEpoch,
            roundedStartDate.millisecondsSinceEpoch);
      }
      if (metadata.size > 0) {
        environment[entry + '.returned.size'] = metadata.size;
        var entrySizeString = getSymbolString(entry + '.returned.size');
        var expectedSizeString = getSymbolString(entry + '.size');
        shouldBe(expectedSizeString, entrySizeString);
      }
      runNextTest();
    } else
      testFailed('Unexpectedly succeeded while ' + stage);
  };
  testErrorCallback(error) {
    if (expectedError != null) {
      shouldBe(error.name, expectedError);
      runNextTest();
    } else {
      testFailed('Got unexpected error ' + error.name + ' while ' + stage);
      //errorCallback(error);
    }
  }
  // Operations ---------------------------------------------------
  getFile(entry, path, [flags=const {}, expectedError=null]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".getFile("' + path + '")';
    var successCallback = flags['create']
      ? testCreateSuccessCallback : testGetSuccessCallback;
    var dir = environment[entry];
    if (flags['create']) {
      if (flags['exclusive'])
        dir.createFile(path, exclusive:true).then(successCallback,
            onError: testErrorCallback);
      else
        dir.createFile(path).then(successCallback,
            onError: testErrorCallback);
    } else {
      dir.getFile(path).then(successCallback, onError: testErrorCallback);
    }
  }
  getDirectory(entry, path, [flags=const {}, expectedError=null]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".getDirectory("' + path + '")';
    var successCallback = flags['create']
      ? testCreateSuccessCallback : testGetSuccessCallback;
    var dir = environment[entry];
    if (flags['create']) {
      if (flags['exclusive'])
        dir.createDirectory(path, exclusive:true).then(successCallback,
            onError: testErrorCallback);
      else
        dir.createDirectory(path).then(successCallback,
            onError: testErrorCallback);
    } else {
      dir.getDirectory(path).then(successCallback, onError: testErrorCallback);
    }
  }
  getParent(entry, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".getParent()';
    environment[entry].getParent().then(testGetParentSuccessCallback,
        onError: testErrorCallback);
  }
  getMetadata(entry, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".getMetadata()';
    environment[entry].getMetadata().then(testMetadataSuccessCallback(entry),
        onError: testErrorCallback);
  }
  remove(entry, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".remove()';
    environment[entry].remove().then(testSuccessCallback,
        onError: testErrorCallback);
  }
  removeRecursively(entry, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".removeRecursively()';
    environment[entry].removeRecursively().then(testSuccessCallback,
        onError: testErrorCallback);
  }
  readDirectory(entry, [expectedError]) {
    this.expectedError = expectedError;
    readEntries = [];
    stage = '"' + entry + '".createReader().readEntries()';
    currentReader = environment[entry].createReader();
    currentReader.readEntries().then(testReadEntriesSuccessCallback,
       onError: testErrorCallback);
  }
  copy(entry, destinationParent, newName, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".copyTo("' + destinationParent + '", "' + newName + '")';
    environment[entry].copyTo(environment[destinationParent], name:newName)
      .then(testSuccessCallback, onError: testErrorCallback);
  }
  move(entry, destinationParent, newName, [expectedError]) {
    this.expectedError = expectedError;
    stage = '"' + entry + '".moveTo("' + destinationParent + '", "' + newName + '")';
    environment[entry].moveTo(environment[destinationParent], name:newName)
      .then(testSuccessCallback, onError: testErrorCallback);
  }
  equals(symbol1, symbol2) {
    shouldBe(getSymbolString(symbol1), getSymbolString(symbol2));
    runNextTest();
  }
  dateIsGreaterThanOrEqualTo(symbol1, symbol2) {
    shouldBeGreaterThanOrEqual(getSymbolString(symbol1).millisecondsSinceEpoch,
        getSymbolString(symbol2).millisecondsSinceEpoch);
    runNextTest();
  }
  //---------------------------------------------------------------
  start() {
    expectedError = null;
    stage = 'resetting filesystem';
    // Record rounded start date (current time minus 999 msec) here for the
    // comparison. Entry.getMetadata() may return the last mod time in seconds
    // accuracy while new Date() is milliseconds accuracy.
    //roundedStartDate = new Date((new Date()).getTime() - 999);
    roundedStartDate = 
      new DateTime.fromMillisecondsSinceEpoch(
          (new DateTime.now()).millisecondsSinceEpoch - 999);
    removeAllInDirectory(fileSystem.root, setUp, testErrorCallback);
  }
  setUp() {
    expectedError = null;
    stage = 'setting up test precondition';
    createTestEnvironment(fileSystem, testCase['precondition'],
        runTests, testErrorCallback);
  }
  runNextTest() {
    if (currentTest >= testCase['tests'].length) {
      verify();
      return;
    }
    testCase['tests'][currentTest++](this);
  }
  runTests(environment) {
    this.environment = environment;
    this.environment['/'] = fileSystem.root;
    currentTest = 0;
    runNextTest();
  }
  verify() {
    expectedError = null;
    if (!testCase.containsKey('postcondition')) {
      successCallback();
      return;
    }
    stage = 'verifying test postcondition';
    verifyTestEnvironment(fileSystem, testCase['postcondition'],
        successCallback, testErrorCallback);
  }
}

runOperationTest(fileSystem, testCase, successCallback, errorCallback)
{
  var helper = new OperationTestHelper(fileSystem, testCase, successCallback, errorCallback);
  helper.start();
}

var currentTest = 0;
var fileSystem = null;
var testCases = null;

runNextTest() {
  if (currentTest >= testCases.length) {
    debug('Finished running tests.');
    asyncEnd();
    return;
  }

  var testCase = testCases[currentTest++];
  debug('* Running: ' + testCase['name']);
  runOperationTest(fileSystem, testCase, runNextTest, errorCallback);
}

errorCallback(error) {
  testFailed('Got error $error');
  asyncEnd();
}

fileSystemCallback(fs) {
  fileSystem = fs;
  runNextTest();
}

run(cases) {
  testCases = cases;
  asyncStart();
  window.requestFileSystem(100).then(fileSystemCallback, onError: errorCallback);
}
