import 'package:flutter/material.dart';
import 'package:yuru_camp/base/contract.dart';
import 'package:yuru_camp/base/presenter.dart';

//TODO : làm todo này vào chiều tối
class EditInfoUserPresenter extends Presenter {
  EditInfoUserPresenter(BuildContext context, Contract view)
      : super(context, view);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final birthController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
}
