import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc["color_id"]],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["notes_title"], style: AppStyle.mainTitle),
          const SizedBox(height: 5.0),
          Text(doc["creation_title"], style: AppStyle.dateTitle),
          const SizedBox(height: 10.0),
          Text(doc["note_content"], style: AppStyle.mainContent, overflow: TextOverflow.ellipsis, maxLines: 5),
        ],
      ),
    ),
  );
}