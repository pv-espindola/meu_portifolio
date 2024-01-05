import 'dart:html' as html;
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';

enum CurriculumType { ptBr, en }

class StorageFactory {
  StorageFactory._();

  static final StorageFactory instance = StorageFactory._();

  final Reference storage = FirebaseStorage.instance.ref();
  final String _fileNameEn = '2024_curriculum_pauloVictor_en.pdf';
  final String _fileNamePtBr = '2024_curriculum_pauloVictor_ptBr.pdf';

  Reference getFileReference(CurriculumType type) {
    switch (type) {
      case CurriculumType.en:
        return storage.child(_fileNameEn);
      case CurriculumType.ptBr:
        return storage.child(_fileNamePtBr);
    }
  }

  String getFileName(CurriculumType type) {
    switch (type) {
      case CurriculumType.en:
        return _fileNameEn;
      case CurriculumType.ptBr:
        return _fileNamePtBr;
    }
  }

  Future<void> downloadCurriculum(CurriculumType type) async {
    Reference ref = getFileReference(type);
    print('ref: ${ref.toString()}');

    final String fileName = getFileName(type);
    try {} on FirebaseException catch (e) {
      print('Error download $e');
      throw Error();
    }
  }

  Future<void> downloadFileFromFirebase() async {
    final ref = storage.child(_fileNamePtBr);

    try {
      final Uint8List? data = await ref.getData();

      final html.Blob blob = html.Blob([data]);

      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = _fileNamePtBr;
      html.document.body!.children.add(anchor);

      anchor.click();

      html.document.body!.children.remove(anchor);
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  launchCurriculum(CurriculumType type) async {
    String fileName = type == CurriculumType.ptBr? _fileNamePtBr : _fileNameEn;
    final ref = storage.child(fileName);
    String path = await ref.getDownloadURL();
    final Uri url = Uri.parse(path);
    _launchURL(url);
  }

  _launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
