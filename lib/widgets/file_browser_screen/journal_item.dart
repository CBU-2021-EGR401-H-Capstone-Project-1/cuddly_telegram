import 'dart:io';

import 'package:cuddly_telegram/model/journal.dart';
import 'package:cuddly_telegram/screens/editor_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A widget that creates a Card representing a Journal entry based on a given
/// index, which points to an object in the `JournalStore`.
///
/// When tapped, the widget will push the editor screen onto the view stack,
/// and pass in this item's `Journal` object to be edited.
class JournalItem extends StatelessWidget {
  const JournalItem({Key? key, required this.journal}) : super(key: key);
  final Journal journal;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.amber.shade50,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditorScreen(journal: journal),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                journal.title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat.yMMMd(Platform.localeName)
                    .format(journal.dateCreated),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Expanded(
                child: Text(
                  journal.document.toPlainText(),
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.fade,
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    if (journal.latitude != null && journal.longitude != null)
                      const Icon(
                        Icons.location_pin,
                        size: 16,
                        color: Colors.green,
                      ),
                    if (journal.calendarDate != null)
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Colors.blue,
                      ),
                    if (journal.notificationId != null)
                      const Icon(
                        Icons.notifications_active,
                        size: 16,
                        color: Colors.red,
                      ),
                    const Spacer(),
                    const Icon(
                      Icons.open_in_new_rounded,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
