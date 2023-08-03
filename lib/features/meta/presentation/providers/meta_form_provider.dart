import 'package:flutter/cupertino.dart';

class MetaFormProvider extends ChangeNotifier{
  MetaFormProvider._();
  static final MetaFormProvider instance = MetaFormProvider._();
  //SINGLETON PARTNER

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;



}