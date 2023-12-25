import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_database/view/widgets/default_button.dart';
import 'package:notes_database/view/widgets/default_text_form_field.dart';

import '../core/controler/db_cubit.dart';
import '../core/controler/db_states.dart';

class AddNotes extends StatelessWidget {
   AddNotes({Key? key}) : super(key: key);
   var formKey = GlobalKey<FormState>();
  var titleControler = TextEditingController();
  var subTitleControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<DataBaseCubit , DataBaseStates>(
        listener: (context , state) {},
        builder: (context , state){
          var cubit = DataBaseCubit.get(context);
          return Scaffold(
            appBar:AppBar(
              title: const Text('Add Notes'),
              elevation: 0.0,
              backgroundColor: Colors.teal,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    defaultFormField(
                        controller: titleControler,
                        type: TextInputType.text,
                        label: 'Title',
                        prefix: Icons.title,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter title';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(
                        controller: subTitleControler,
                        type: TextInputType.text,
                        label: 'Sub Title',
                        prefix: Icons.subject,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter subTitle';
                          }
                          return null;
                        }),
                    const SizedBox(height: 50,),
                    defaultButton(
                      function:(){
                        if(formKey.currentState!.validate()){
                          cubit.insertNotes(
                              title: titleControler.text,
                              subtitle: subTitleControler.text,
                          );
                          final snackBar = SnackBar(
                            content: const Text('Add note Successfully'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                cubit.deleteData(id: cubit.notes[cubit.notes.length-1]['id']);
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }

                      },
                      text: 'add note',
                      isUpperCase: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  }
}
