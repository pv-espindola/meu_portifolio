import 'package:flutter/cupertino.dart';
import 'package:meu_portifolio/config/app_config.dart';
import 'package:meu_portifolio/features/meta/data/models/meta_state.dart';
import 'package:meu_portifolio/features/meta/data/models/post_model.dart';
import 'package:meu_portifolio/features/meta/domain/repositories/meta_post_firestore.dart';

import '../../data/enums.dart';

class MetaProvider extends ChangeNotifier {
  MetaProvider._();

  static final MetaProvider instance = MetaProvider._();

  //SINGLETON PARTNER
  final MetaPostFirestore database = MetaPostFirestore();

  MetaState _state = MetaState.empty();

  MetaState get state => _state;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  final PostModel _postModel = PostModel.empty();

  PostType get postType => _postModel.type;

  void loadMetaState() async {
    List<PostModel> notes = await database.getPosts(PostType.note);
    List<PostModel> questions = await database.getPosts(PostType.question);
    List<PostModel> challenges = await database.getPosts(PostType.challenge);

    updateState(
        notes: notes,
        questions: questions,
        challenges: challenges,
        status: MetaStatus.loaded);

    print('Meta status : ${_state.status.name}');
  }

  void updateState({
    List<PostModel>? notes,
    List<PostModel>? questions,
    List<PostModel>? challenges,
    MetaStatus? status,
    FormStatus? formStatus,
}){
    _state = _state.copyWith(
      notes: notes,
      questions: questions,
      challenges: challenges,
      status: status,
      formStatus: formStatus,
    );
    notifyListeners();
  }

  void createPost() async {
    database.savePost(_postModel);
    insertPostInState();
    notifyListeners();
  }

  insertPostInState(){
    switch(_postModel.type){
      case PostType.note : _state.notes.insert(0,_postModel);
      case PostType.question : _state.questions.insert(0,_postModel);
      case PostType.challenge : _state.challenges.insert(0,_postModel);
    }
    updateState(formStatus: FormStatus.completed);
  }

  List<PostModel> getPostContent(PostType type) {
    switch (type) {
      case PostType.note:
        return _state.notes;
      case PostType.question:
        return _state.questions;
      case PostType.challenge:
        return _state.challenges;
    }
  }


  void validate() {
    if (_formKey.currentState!.validate()) {
      createPost();
    } else {
      print('Nao é valido ainda');
    }
  }

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatorio';
    }
    _postModel.name = value;
    return null;
  }

  String? roleValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatorio';
    }
    _postModel.role = value;
    return null;
  }

  String? emailValidate(String? value) {
    bool isEmailValid = value!.isValidEmail();;
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatorio';
    }
    else if(!isEmailValid){
      return 'Use um email válido';
    }
    _postModel.email = value;
    return null;
  }

  String? messageValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obrigatorio';
    }
    _postModel.message = value;
    return null;
  }

  void setPostType(PostType postType) {
    _postModel.type = postType;
    notifyListeners();
  }
}
