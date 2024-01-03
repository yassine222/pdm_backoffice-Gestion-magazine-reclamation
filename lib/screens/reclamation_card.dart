import 'package:flutter/material.dart';

class ReclamationCard extends StatelessWidget {
  final String title;
  final String description;
  final bool status;
  final String createdAt;
  final String updatedAt;
  final VoidCallback onUpdateStatus;
  final VoidCallback ondelete;

  ReclamationCard({
    required this.title,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.onUpdateStatus,
    required this.ondelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: ondelete, icon: const Icon(Icons.delete))
              ],
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  status ? Icons.check : Icons.close,
                  color: status ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 5),
                Text(
                  status ? 'Resolved' : 'Pending',
                  style: TextStyle(
                    color: status ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Created At: $createdAt',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Updated At: $updatedAt',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            status == false
                ? TextButton(
                    onPressed: onUpdateStatus,
                    child: const Text(
                      'Update Status',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
