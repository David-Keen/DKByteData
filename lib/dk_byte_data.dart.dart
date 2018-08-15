import 'dart:io';
import 'dart:typed_data';
import 'dart:mirrors';
import 'dk_byte_data.dart';

class DKByteData {
  ByteData _data;
  int _i = 0;

  skipBy({int numberOfBytes}){
	_i += numberOfBytes;
  }

  DKByteData(ByteBuffer buffer) {
	this._data = new ByteData.view(buffer);
  }

  int nextInt8() {
    int result = _data.getInt8(_i);
    _i++;
    return result;
  }

  int nextUint8() {
    int result = _data.getUint8(_i);
    _i++;
    return result;
  }

  int nextUint16() {
    int result = _data.getUint16(_i, Endianness.LITTLE_ENDIAN);
    _i += 2;
    return result;
  }

  int nextUint() {
    int result = _data.getUint32(_i, Endianness.LITTLE_ENDIAN);
    _i += 2;
    return result;
  }

  int nextUint64() {
    int result = _data.getUint64(_i, Endianness.LITTLE_ENDIAN);
    _i += 8;
    return result;
  }

  double nextFloat() {
    double result = _data.getFloat32(_i, Endianness.LITTLE_ENDIAN);
    _i += 4;
    return result;
  }

  String nextString({int length}) {
    String string = "";
	for(int i = 0; i < length; i++) {
		string += new String.fromCharCode(this.nextUint8());
	}
	return string;
  }
}
