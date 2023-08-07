
import 'post_model.dart';

enum MetaStatus { empty, loaded }

enum FormStatus { empty, completed }

class MetaState {
  List<PostModel> notes;
  List<PostModel> questions;
  List<PostModel> challenges;
  MetaStatus status;
  FormStatus formStatus;

  MetaState({
    required this.notes,
    required this.questions,
    required this.challenges,
    required this.status,
    required this.formStatus,
  });

  factory MetaState.empty() => MetaState(
      notes: [],
      questions: [],
      challenges: [],
      status: MetaStatus.empty,
      formStatus: FormStatus.empty);

  MetaState copyWith({
    List<PostModel>? notes,
    List<PostModel>? questions,
    List<PostModel>? challenges,
    MetaStatus? status,
    FormStatus? formStatus,
  }) {
    return MetaState(
      notes: notes ?? this.notes,
      questions: questions ?? this.questions,
      challenges: challenges ?? this.challenges,
      status: status ?? this.status,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
