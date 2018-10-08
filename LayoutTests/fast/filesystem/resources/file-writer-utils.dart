library file_writer_utils;

import "dart:html";
import "../../../testcommon.dart";

var fileEntryForCleanup;  // Set as soon as we have one.

finishTest(_) => asyncEnd();

cleanUp() {
  if (fileEntryForCleanup != null) {
    try {
      fileEntryForCleanup.remove().then(finishTest, onError: finishTest);
      return;
    } catch (ex) {
    }
  }
  asyncEnd();
}

onError(e) {
  testFailed("Got error: ${e.type} $e");
  cleanUp();
}

_assert(b) => shouldBeTrue(b);

// Generic  that gets a File from a FileEntry and calls a custom verification  on it.
verifyFileContents(fileEntry, verifyFunc, arg0, arg1, onSuccess)
{
  fileEntry.file().then((file) {
    verifyFunc(file, arg0, arg1, onSuccess);
  }, onError: onError);
}

// Helper  used with verifyFileContents.
verifyFileLengthHelper(file, length, unused, onSuccess)
{
  _assert(file.size == length);
  onSuccess();
}

// Verifies that the contents of fileEntry have the supplied length.
verifyFileLength(fileEntry, length, onSuccess)
{
  verifyFileContents(fileEntry, verifyFileLengthHelper, length, null, onSuccess);
}

// Helper  used with verifyFileContents.
verifyByteRangeIsZeroesHelper(file, start, length, onSuccess)
{
  FileReader fileReader = new FileReader();
  fileReader.onError.listen(onError);
  fileReader.onLoad.listen((_) {
    dynamic result = fileReader.result;
    for (var i = 0; i < length; i++)
      _assert(result[i] == 0);
    onSuccess();
  });
  fileReader.readAsArrayBuffer(file.slice(start, start + length));
}

// Verifies that fileEntry, at offset, is all zeroes for length bytes.
verifyByteRangeIsZeroes(fileEntry, offset, length, onSuccess)
{
  verifyFileContents(fileEntry, verifyByteRangeIsZeroesHelper, offset, length, onSuccess);
}

// Helper  used with verifyFileContents.
verifyByteRangeAsStringHelper(file, start, data, onSuccess)
{
  var fileReader = new FileReader();
  fileReader.onError.listen(onError);
  fileReader.onLoad.listen((_) {
    _assert(fileReader.result == data);
    onSuccess();
  });
  fileReader.readAsText(file.slice(start, start + data.length));
}

// Verifies that the contents of fileEntry, at offset, match contents [a string].
verifyByteRangeAsString(fileEntry, offset, contents, onSuccess)
{
  verifyFileContents(fileEntry, verifyByteRangeAsStringHelper, offset, contents, onSuccess);
}

// Creates a file called fileName in fileSystem's root directory, truncates it to zero length just in case, and calls onSuccess, passing it a FileEntry and FileWriter for the new file.
createEmptyFile(fileSystem, fileName, onSuccess)
{
  getSuccessFunc(fileEntry) {
    // Create a fresh FileWriter here, rather than pass in the used one.
    // This way we don't accidentally leave our event handlers attached.
    return () {
      fileEntry.createWriter().then((fw) {
        onSuccess(fileEntry, fw);
      }, onError: onError);
    };
  }
  getFileWriterCallback(fileEntry) {
    return (fileWriter) {
      var successFunc = getSuccessFunc(fileEntry);
      fileWriter.onError.listen(onError);
      fileWriter.onWrite.take(1).listen((_) {
        verifyFileLength(fileEntry, 0, successFunc);
      });
      fileWriter.truncate(0);
    };
  }
  onFileEntry(fileEntry) {
    fileEntryForCleanup = fileEntry;
    var onFileWriter = getFileWriterCallback(fileEntry);
    fileEntry.createWriter().then(onFileWriter, onError: onError);
  }
  _assert(fileSystem != null);
  fileSystem.root.createFile(fileName).then(onFileEntry, onError: onError);
}

writeString(fileEntry, fileWriter, offset, data, onSuccess)
{
  var blob = new Blob([data]);
  fileWriter.seek(offset);
  fileWriter.write(blob);
  fileWriter.onError.listen(onError);
  if (offset < 0)
    offset += fileWriter.length;
  _assert(offset >= 0);
  fileWriter.onWrite.take(1).listen((_) {
    verifyByteRangeAsString(fileEntry, offset, data, onSuccess);
  });
}

setFileContents(fileEntry, fileWriter, contents, onSuccess) {
  fileWriter.onError.listen(onError);
  fileWriter.onWrite.take(1).listen((_) {
    writeString(fileEntry, fileWriter, 0, contents, onSuccess);
  });
  fileWriter.truncate(0);
}

setupAndRunTest(size, testName, testFunc)
{
  asyncStart();
  debug("starting test");
  window.requestFileSystem(size).then((fs) {
    createEmptyFile(fs, testName, testFunc);
  }, onError: onError);
}
