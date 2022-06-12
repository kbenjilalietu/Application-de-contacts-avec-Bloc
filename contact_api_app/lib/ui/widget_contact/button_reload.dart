
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact/contact_bloc.dart';
import '../../bloc/contact/contact_state.dart';

class ButtonReload extends StatelessWidget {
  final ContactState state;
  ButtonReload({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      ContactBloc messageBloc=context.read<ContactBloc>();
      context.read<ContactBloc>().add(state.currentEvent);

    }, child: Text("Reload"));
  }
}
