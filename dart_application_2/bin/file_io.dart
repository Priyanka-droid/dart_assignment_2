import 'dart:convert';
import 'dart:io';

class FileIO {
  // file to save student details
  static File fileCreation() {
    String fileName = "student_details.json";
    File file = new File(fileName);
    // // check if file we want to read exist
    bool fileExist = File("../bin/${fileName}").existsSync();
    // // if file does not exist create the file with empty data
    if (!fileExist) {
      file.writeAsStringSync(jsonEncode([]), mode: FileMode.write);
    }
    return file;
  }

  // read the file
  static String fileRead(File file) {
    String contents = file.readAsStringSync();
    return contents;
  }

  // write to the file
  static void fileWrite(String jsonContent, File file) {
    file.writeAsStringSync(jsonContent, mode: FileMode.write);
  }
}
