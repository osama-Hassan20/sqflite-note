import 'package:flutter/material.dart';
import 'package:notes_database/core/controler/db_cubit.dart';
import 'package:notes_database/core/navigate.dart';
import 'package:notes_database/view/edit_notes.dart';

Widget buildNoteItem(Map note, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,

        // height: 100,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.teal[300]),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${note['title']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      navigateTo(context, EditNote(note: note));
                    },
                    icon: const Icon(
                      Icons.edit_note,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                note['subtitle'],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      DataBaseCubit.get(context).deleteData(id: note['id']);

                      const snackBar = SnackBar(
                        content: Text('Delete note Successfully'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
