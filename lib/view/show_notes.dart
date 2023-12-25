import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_database/view/add_notes.dart';
import 'package:notes_database/view/widgets/build_note_item.dart';
import 'package:notes_database/core/navigate.dart';

import '../core/controler/db_cubit.dart';
import '../core/controler/db_states.dart';

class ShowNoteScreen extends StatelessWidget {
  const ShowNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<DataBaseCubit , DataBaseStates>(
        listener: (context , state) {},
        builder: (context , state){
          var cubit = DataBaseCubit.get(context);
          return Scaffold(
            appBar:AppBar(
              title: const Text('Notes'),
              elevation: 0.0,
              backgroundColor: Colors.teal,
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context, AddNotes());
                    },
                    icon: const Icon(
                      Icons.add_chart_sharp
                    ),
                ),
              ],
            ),
            body:
            cubit.notes.isEmpty?const Center(
              child: Text('notes is empty'),
            )
            :ListView.separated(
              itemBuilder: (context , index) =>buildNoteItem(cubit.notes[index],context),
              separatorBuilder: (context , index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: cubit.notes.length,)
          );
        },
      );

  }
}
