import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final void Function()? onPreesedFavorite;
  final void Function()? onPreesedNotfication;
  final void Function()? onPreesedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? myController;

  const CustomAppbar({
    super.key,
    required this.title,
    this.onPreesedFavorite,
    this.onPreesedNotfication,
    this.onPreesedSearch,
    this.onChanged,
    this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).cardColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                prefixIcon: IconButton(
                  onPressed: onPreesedSearch, 
                  icon: const Icon(Icons.search),
                  color: Colors.grey.shade600,
                ),
                hintText: title,
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildActionButton(context, Icons.favorite_border_rounded, onPreesedFavorite),
          const SizedBox(width: 12),
          _buildActionButton(context, Icons.notifications_none_rounded, onPreesedNotfication),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.grey.shade700),
        splashRadius: 24,
      ),
    );
  }
}
